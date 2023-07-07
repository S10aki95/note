data {
  int<lower=0> K;
  int<lower=0> N;
  array[N] real y;
}
parameters {
  real alpha;
  array[K] real beta;
  real sigma;
}
model {
  for (n in (K+1):N) {
    real mu = alpha;
    for (k in 1:K) {
      mu += beta[k] * y[n-k];
    }
    y[n] ~ normal(mu, sigma);
  }
}