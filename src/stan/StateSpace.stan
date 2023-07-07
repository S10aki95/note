data {
  int<lower=0> T; // Num of time points
  int<lower=0> K; // Num of regresssors
  array[T] real y;
  matrix[T, K] X;
}

parameters {
  vector[K] X_beta;
  real mu_beta; 
  
  array[T] real mu;

  real<lower=0> s_W;;  // 過程誤差の標準偏差
  real<lower=0> s_v;  // 観測誤差の標準偏差
}



model {
  // 状態方程式に従い、状態が遷移する
  for(t in 2:T) {
    mu[t] ~ normal(mu[t-1], s_W);
  }
  
  // 観測方程式に従い、観測値が得られる
  for(t in 1:T) {
    y[t] ~ normal(mu[t] * mu_beta + X[t] * X_beta, s_v);
  }
}