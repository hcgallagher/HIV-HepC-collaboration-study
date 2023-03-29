# insert covariates in the network object
net %v% 'funder' = funder
net %v% 'type' = type
net %v% 'size' = orgSize
net %v% 'national' = national
net %v% 'Both' = Both
net %v% 'HCV' = HCV
net %v% 'CALD' = CALD



# the ERGM described above
model_101 = net ~ edges +
  mutual +
  nodeicov('funder') +
  nodeocov('funder') + 
  nodeicov('CALD') +
  nodeocov('CALD') + 
  nodeicov('Both') +
  nodeocov('Both') + 
  nodematch('Both') + 
  nodeicov('HCV') +
  nodeocov('HCV') + 
  nodematch('HCV') + 
  nodeicov('size') +
  nodeocov('size') + 
  nodematch('size') + 
  nodeicov('national') +
  nodeocov('national') + 
  nodematch('national') + 
  # nodeicov('type') +
  # nodeocov('type') + 
  nodematch('type') +
  m2star +
  gwidegree(decay = log(2), fixed = TRUE) + 
  gwodegree(decay = log(2), fixed = TRUE) +
  gwdsp(decay = log(2), fixed = TRUE) +
  gwesp(decay = log(2), fixed = TRUE) 
# edgecov(adjArray[,,"12mo_Org_planning_receive"])