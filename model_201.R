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



# the ERGM described above
model_201 = net ~ edges +
  mutual +
  nodeicov('funder') +
  nodeocov('funder') + 
  nodeicov('CALD') +
  nodeocov('CALD') + 
  nodeicov('HCV') +
  nodeocov('HCV') + 
  # nodematch("HCVonly", diff = TRUE, levels = -1) + 
  nodeicov('HCVonly') +
  nodeocov('HCVonly') + 
  nodematch("HCV", diff = TRUE, levels = -1) + 
  # nodematch("HIVonly", diff = TRUE, levels = -1) +
  nodeicov('size') +
  nodeocov('size') + 
  nodematch('size') + 
  nodeicov('national') +
  nodeocov('national') + 
  nodematch('national') + 
  # nodeicov('type') +
  # nodeocov('type') + 
  # nodematch('type') +
  m2star +
  istar(k = 2) + 
  istar(k = 3) +
  ostar(k = 2) + 
  ostar(k = 3) +
  ttriple +
  ctriple
# edgecov(adjArray[,,"12mo_Org_planning_receive"])