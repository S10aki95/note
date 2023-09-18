# 強化学習についての基本

## 方策反復法

得られた報酬に沿って方策に従った行動を評価し、学習する方法

- On Policy
  - 定義：行動価値関数の更新がPolicyに依存する
- Off Policy
  - 定義：行動価値関数の更新がPolicyに依存する

### 方策勾配法

#### 状態価値関数
一般的に、以下のベルマン方程式で表現される

$$V^\pi(s_t) = \max_{a} E[R_{s,a} + \gamma V^\pi(s_{t+1})]$$

ただし、
- $V^\pi(s_t)$は状態$s$での価値評価


#### Q学習

行動価値関数の更新式：$Q(s_t, a_t) = R_{t+1} + \gamma \max_a Q(s_{t+1}, a)$が成り立つように、以下のように設定される

$$Q(s_t, a_t) = Q(s_t, a_t) + \eta (R_{t+1} + \gamma \max_a Q(s_{t+1}, a) - Q(s_t, a_t))$$

Deep Learningで学習させる場合、以下のloss関数を利用することで、学習が可能になる。

$$E(s_t, a_t) = (Q(s_t, a_t) - R_{t+1} + \gamma \max_a Q(s_{t+1}, a))^2$$

## 価値反復法

報酬を得られる状態から逆算して行動を評価する方法

#TODO:それぞれのメリデメをまとめる 