data {
  // num of data
  int<lower=0> N_obs;
  int<lower=0> N_cens_upper;
  int<lower=0> N_cens_lower;
  int<lower=0> n_dim;
  
  // observation data
  vector[N_obs] y_obs;
  matrix[N_obs, n_dim] X_obs; 
  matrix[N_cens_upper, n_dim] X_cens_upper;
  matrix[N_cens_lower, n_dim] X_cens_lower;
  
  // settings
  real<lower=max(y_obs)> upper_bound;
  real<upper=min(y_obs)> lower_bound;
}

parameters {
  vector[n_dim] beta;
  real<lower=0> sigma;
  vector<lower=upper_bound>[N_cens_upper] y_cens_upper;
  vector<upper=lower_bound>[N_cens_lower] y_cens_lower;
}

model {
  y_obs ~ normal(X_obs * beta, sigma);
  y_cens_upper ~ normal(X_cens_upper * beta, sigma);
  y_cens_lower ~ normal(X_cens_lower * beta, sigma);
}