data {
  // num of data
  int<lower=0> N;
  int<lower=0> J;
  
  // observation data
  vector[N] y_obs;
  matrix[N, J] f_matrix; 
}

parameters {
  matrix[N, J] beta;
  real<lower=0> sigma;
  vector<lower=0>[J] tau;
}

model {
    y_obs ~ normal(sum(beta .* f_matrix), sigma);   
}