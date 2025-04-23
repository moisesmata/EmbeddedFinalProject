// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarIsDeposited=0;
scalar fNettypeIsForced=0;
scalar fNettypeIsReleased=0;
void  schedNewEvent (struct dummyq_struct * I1405, EBLK  * I1400, U  I622);
void  rmaPropagate23_simv_daidir (UB  * pcode, scalar  val)
{
    UB  * I1739;
    typedef
    UB
     * TermTypePtr;
    U  I1419;
    U  I967;
    TermTypePtr  I1451;
    scalar  * I991;
    I1451 = (TermTypePtr )pcode;
    I967 = *I1451;
    I1451 -= I967;
    I991 = (scalar  *)(I1451 + 2U);
    if (I991[I967] == val) {
        return  ;
    }
    I991[I967] = val;
    val = I991[0];
    val = Xunion[(val << 7) + I991[1U]];
    pcode = ((UB  *)I1451) + 4U;
    {
        U  I1468 = 0;
        pcode = (UB  *)((UB  *)(((RP )pcode + I1468 + 3) & ~3));
    }
    {
        EBLK  * I1400;
        struct dummyq_struct * pQ;
        U  I1403;
        I1403 = 0;
        pQ = (struct dummyq_struct *)ref_vcs_clocks;
        if (*(scalar  *)((pcode + 0) + 12U) != val) {
            RmaEblk  * I1400 = (RmaEblk  *)(pcode + 0);
            *(scalar  *)((pcode + 0) + 12U) = val;
            if (!(I1400->I664)) {
                pQ->I1301->I664 = (EBLK  *)I1400;
                pQ->I1301 = (EBLK  *)I1400;
                I1400->I664 = (RP )((EBLK  *)-1);
                if (0 && rmaProfEvtProp) {
                    vcs_simpSetEBlkEvtID(I1400);
                }
            }
        }
    }
}
void  rmaPropagate23_s0_simv_daidir (UB  * pcode, scalar  val)
{
    val = *(scalar  *)((pcode + 0) + 12U);
    if (*(pcode + 20) == val) {
        return  ;
    }
    *(pcode + 20) = val;
    {
        RmaNbaGate1  * I1501 = (RmaNbaGate1  *)(pcode + 24);
        U  I1502 = (((I1501->I59) >> (16)) & ((1 << (1)) - 1));
        scalar  I1123 = X4val[val];
        if (I1502) {
            I1501->I1129.I763 = (void *)((RP )(((RP )(I1501->I1129.I763) & ~0x3)) | (I1123));
        }
        else {
            I1501->I1129.I765.I740 = I1123;
        }
        NBA_Semiler(0, &I1501->I1129);
    }
}
void  rmaPropagate28_simv_daidir (UB  * pcode, scalar  val)
{
    UB  * I1739;
    *(pcode + 0) = val;
    {
        RmaNbaGate1  * I1501 = (RmaNbaGate1  *)(pcode + 4);
        U  I1502 = (((I1501->I59) >> (16)) & ((1 << (1)) - 1));
        scalar  I1123 = X4val[val];
        if (I1502) {
            I1501->I1129.I763 = (void *)((RP )(((RP )(I1501->I1129.I763) & ~0x3)) | (I1123));
        }
        else {
            I1501->I1129.I765.I740 = I1123;
        }
        NBA_Semiler(0, &I1501->I1129);
    }
}
void  rmaPropagate28_t0_simv_daidir (UB  * pcode, UB  val)
{
    val = *(pcode + 0);
    *(pcode + 0) = 0xff;
    rmaPropagate28_simv_daidir(pcode, val);
}
void  rmaPropagate32_simv_daidir (UB  * pcode, scalar  val)
{
    UB  * I1739;
    *(pcode + 0) = val;
    {
        RmaNbaGate1  * I1501 = (RmaNbaGate1  *)(pcode + 4);
        U  I1502 = (((I1501->I59) >> (16)) & ((1 << (1)) - 1));
        scalar  I1123 = X4val[val];
        if (I1502) {
            I1501->I1129.I763 = (void *)((RP )(((RP )(I1501->I1129.I763) & ~0x3)) | (I1123));
        }
        else {
            I1501->I1129.I765.I740 = I1123;
        }
        NBA_Semiler(0, &I1501->I1129);
    }
}
void  rmaPropagate32_t0_simv_daidir (UB  * pcode, UB  val)
{
    val = *(pcode + 0);
    *(pcode + 0) = 0xff;
    rmaPropagate32_simv_daidir(pcode, val);
}
void  rmaPropagate36_simv_daidir (UB  * pcode, scalar  val)
{
    UB  * I1739;
    typedef
    UB
     * TermTypePtr;
    U  I1419;
    U  I967;
    TermTypePtr  I1451;
    scalar  * I991;
    I1451 = (TermTypePtr )pcode;
    I967 = *I1451;
    I1451 -= I967;
    I991 = (scalar  *)(I1451 + 2U);
    if (I991[I967] == val) {
        return  ;
    }
    I991[I967] = val;
    val = I991[0];
    val = Xunion[(val << 7) + I991[1U]];
    pcode = ((UB  *)I1451) + 4U;
    {
        U  I1468 = 0;
        pcode = (UB  *)((UB  *)(((RP )pcode + I1468 + 3) & ~3));
    }
    {
        EBLK  * I1400;
        struct dummyq_struct * pQ;
        U  I1403;
        I1403 = 0;
        pQ = (struct dummyq_struct *)ref_vcs_clocks;
        if (*(scalar  *)((pcode + 0) + 12U) != val) {
            RmaEblk  * I1400 = (RmaEblk  *)(pcode + 0);
            *(scalar  *)((pcode + 0) + 12U) = val;
            if (!(I1400->I664)) {
                pQ->I1301->I664 = (EBLK  *)I1400;
                pQ->I1301 = (EBLK  *)I1400;
                I1400->I664 = (RP )((EBLK  *)-1);
                if (0 && rmaProfEvtProp) {
                    vcs_simpSetEBlkEvtID(I1400);
                }
            }
        }
    }
}
void  rmaPropagate36_t0_simv_daidir (UB  * pcode, UB  val)
{
    typedef
    UB
     * TermTypePtr;
    U  I1419;
    U  I967;
    TermTypePtr  I1451;
    scalar  * I991;
    I1451 = (TermTypePtr )pcode;
    I967 = *I1451;
    I1451 -= I967;
    I991 = (scalar  *)(I1451 + 2U);
    val = I991[I967];
    I991[I967] = 0xff;
    rmaPropagate36_simv_daidir(pcode, val);
}
void  rmaPropagate36_s0_simv_daidir (UB  * pcode, scalar  val)
{
    val = *(scalar  *)((pcode + 0) + 12U);
    if (*(pcode + 20) == val) {
        return  ;
    }
    *(pcode + 20) = val;
    {
        RmaNbaGate1  * I1501 = (RmaNbaGate1  *)(pcode + 24);
        U  I1502 = (((I1501->I59) >> (16)) & ((1 << (1)) - 1));
        scalar  I1123 = X4val[val];
        if (I1502) {
            I1501->I1129.I763 = (void *)((RP )(((RP )(I1501->I1129.I763) & ~0x3)) | (I1123));
        }
        else {
            I1501->I1129.I765.I740 = I1123;
        }
        NBA_Semiler(0, &I1501->I1129);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
