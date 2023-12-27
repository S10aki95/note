data {
  int<lower=0> T; // 時点数
  int<lower=0> K; // 要因モデルの数
  array[T] real y; // 予測
  matrix[T, K] mf; // 予測平均
  matrix[T, K] vf; // 予測分散
}

parameters {
  vector[T, K] X_beta;
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
    y[t] ~ normal(X[t] * X_beta, s_v);
  }
}