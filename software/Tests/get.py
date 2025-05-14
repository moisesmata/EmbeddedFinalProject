import requests
import re
import pandas as pd

masses_kg = {
    'Sun': 1.9885e30,
    'Mercury': 3.3011e23,
    'Venus': 4.8675e24,
    'Earth': 5.9724e24,
    'Moon': 7.342e22,
    'Mars': 6.4171e23,
    'Jupiter': 1.8982e27,
    'Saturn': 5.6834e26,
    'Uranus': 8.6810e25,
    'Neptune': 1.02413e26,
    'Io': 8.9319e22,
    'Europa': 4.7998e22,
    'Ganymede': 1.4819e23,
    'Callisto': 1.0759e23,
}

object_ids = {
    '10': 'Sun',
    '199': 'Mercury',
    '299': 'Venus',
    '399': 'Earth',
    '301': 'Moon',
    '499': 'Mars',
    '599': 'Jupiter',
    '501': 'Io',
    '502': 'Europa',
    '503': 'Ganymede',
    '504': 'Callisto',
    '699': 'Saturn',
    '799': 'Uranus',
    '899': 'Neptune',
}

url = "https://ssd.jpl.nasa.gov/api/horizons.api"
pattern = re.compile(
    r"X =\s*([-+E0-9\.]+)\s*Y =\s*([-+E0-9\.]+)\s*Z =\s*([-+E0-9\.]+).*?"
    r"VX=\s*([-+E0-9\.]+)\s*VY=\s*([-+E0-9\.]+)\s*VZ=\s*([-+E0-9\.]+)",
    re.DOTALL
)

records = []
for obj_id, obj_name in object_ids.items():
    params = {
        "format": "json",
        "EPHEM_TYPE": "VECTORS",
        "COMMAND": obj_id,
        "CENTER": "500@0",
        "START_TIME": "2025-05-13T00:00:00",
        "STOP_TIME": "2025-05-13T00:00:01",
        "STEP_SIZE": "1d",
        "REF_PLANE": "ECLIPTIC",
        "REF_SYSTEM": "ICRF",
        "OUT_UNITS": "KM-S"
    }
    response = requests.get(url, params=params)
    data = response.json()
    if "error" in data:
        print(f"Error for {obj_name}: {data['error']}")
        continue
    result_text = data["result"] if isinstance(data["result"], str) else list(data["result"].values())[0]
    match = pattern.search(result_text)
    if not match:
        print(f"⚠️ Could not parse object {obj_name}")
        continue
    x, y, z, vx, vy, vz = map(lambda v: float(v) * 1e3, match.groups())
    records.append({
        "Object": obj_name,
        "X (m)": x, "Y (m)": y, 
        "VX (m/s)": vx, "VY (m/s)": vy, "M (kg)": masses_kg[obj_name]*6.67430e-11*60*60*12,
    })

df = pd.DataFrame(records)
df = df[["X (m)", "Y (m)", "VX (m/s)", "VY (m/s)", "M (kg)"]]
df.to_csv("output.csv", index=False)
print(df)
