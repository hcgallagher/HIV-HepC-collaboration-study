


# the ERGM described above
model_001 = net ~ edges +
  mutual +
  m2star +
  gwidegree(decay = log(2), fixed = TRUE) + 
  gwodegree(decay = log(2), fixed = TRUE) +
  gwdsp(decay = log(2), fixed = TRUE) +
  gwesp(decay = log(2), fixed = TRUE) 
# edgecov(adjArray[,,"12mo_Org_planning_receive"])