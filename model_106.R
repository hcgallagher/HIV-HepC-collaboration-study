# insert covariates in the network object
net %v% 'funder' = funder
net %v% 'type' = type
net %v% 'size' = orgSize
net %v% 'national' = national
net %v% 'Both' = Both
net %v% 'HCV' = HCV
net %v% 'HCVonly' = HCVonly
net %v% 'HIVonly' = HIVonly
net %v% 'CALD' = CALD
net %v% 'sector' = actualSector
net %v% 'hierarchy' = hierarchy

# summary(net ~ nodemix("hierarchy", levels2=-1))

# the ERGM described above
currentmodel = net ~ edges +
  mutual +
  nodeicov('funder') +
  nodeocov('funder') + 
  # absdiffcat('hierarchy') +
  nodemix("hierarchy", levels2=-1) +
  nodeicov('HCV') +
  nodeocov('HCV') + 
  nodematch("HCV", diff = TRUE, levels = -1) + 
  nodeicov('HCVonly') +
  nodeocov('HCVonly') + 
  nodematch("HCVonly", diff = TRUE, levels = -1) + 
  # nodematch("HIVonly", diff = TRUE, levels = -1) +
  nodeicov('size') +
  nodeocov('size') +
  nodematch('size') +
  nodeicov('national') +
  nodeocov('national') +
  nodematch('national') +
  m2star +
  ctriple +
  # istar(k = 2) +  #this differentiates the model from 103
  # istar(k = 3) +
  # dgwdsp(decay = log(2), fixed = TRUE, type="RTP") + 
  gwidegree(decay = log(2), fixed = TRUE) + 
  gwodegree(decay = log(2), fixed = TRUE) +
  gwdsp(decay = log(2), fixed = TRUE) +
  gwesp(decay = log(2), fixed = TRUE) 
# edgecov(adjArray[,,"12mo_Org_planning_receive"])