# Causal Inference for Statistics Social and Biomedical Sciences an Introduction

## 9章 Stratified Randomized Experiments

共変量を回帰モデルの説明変数として取り込む以外のアプローチ

基本事項
- Stratified Randomized Experimentsとは
  - 共変量の組み合わせごとに一定の割合で介入群と対照群を作り、それぞれのグループでの介入効果を合成するやり方
- メリット
  - 目的変数に関連する共変量に沿って分類された場合、完全なCRT (Completely Randomized experiments)よりも強い因果効果の推定が可能になる。
- デメリット
  - Stratified Randomizationを行うことで、assignmentの組み合わせの一部が計算上排除され、その場合の因果効果を考慮しないこと

> ### 層化抽出実験におけるフィッシャーのEXACT P-VALUES

#### > 帰無仮説 (Fisher’s sharp null hypothesis)を検定

- 設定
  - $H_0 : Y(1) - Y(0) = 0$
  - 2個のstratum：$j \in \{f, m\}$
  - $W_i$ : treatment

- 定義：因果効果

$$T^{dif, \lambda} = |\lambda (\overline{Y}_t^{obs} (f) - \overline{Y}_c^{obs} (f)) + (1 - \lambda) \cdot (\overline{Y}_t^{obs} (m) - \overline{Y}_c^{obs} (m))|$$

ただし、$\exist\lambda \in [0, 1]$
$$\overline{Y}_c^{obs} (j) = \frac{1}{N_c(j)} \sum_{i: G_i = j}(1 - W_i) \cdot Y_i^{obs}$$

$$\overline{Y}_t^{obs} (j) = \frac{1}{N_t(j)} \sum_{i: G_i = j} W_i \cdot Y_i^{obs}$$


> $\lambda$をそれぞれのstartumのサイズで調整する場合

$$\lambda = \frac{N(f)}{N(f) + N(m)}$$

> $\lambda$を標本分散で調整する場合

$$ \lambda = \argmin_{\lambda} V_{\mathbb{W}} (T^{dif, \lambda})$$ 
$$
V_{\mathbb{W}} (T^{dif, \lambda}) = \\
\lambda^2  \cdot V_{\mathbb{W}}(\overline{Y}_t^{obs} (f) - \overline{Y}_c^{obs} (f)) + (1 - \lambda)^2 \cdot V_{\mathbb{W}}(\overline{Y}_t^{obs} (m) - \overline{Y}_c^{obs} (m)) \\
= \lambda^2  \cdot S^2 \cdot \Big(\frac{1}{N_t(f)} + \frac{1}{N_c(f)}\Big) + (1 - \lambda)^2 \cdot S^2 \cdot \Big(\frac{1}{N_t(m)} + \frac{1}{N_c(m)}\Big)
$$

$$\therefore \lambda_{opt} = \frac{N(f) \frac{N_t(f)}{N(f)}\frac{N_c(f)}{N(f)}}{N(f) \frac{N_t(f)}{N(f)}\frac{N_c(f)}{N(f)} + N(m) \frac{N_t(m)}{N(m)}\frac{N_c(m)}{N(m)}}$$



> ### 代表的な実験：幼稚園のクラス分け
- 3つのタイプのクラスに分類（小さいクラス、普通サイズのクラス、普通サイズの補佐先生付きのクラス）
- 振り分け方法
  - Step1：先生を3つのクラスのどれかに振り分けする
  - Step2：生徒をランダムにいずれかのクラスに振り分ける
- 仮説：小さいクラスの方がテストの成績が良い

今回では、上記のケースについて性別でStratified Randomized Experimentsを行ったケースについて考える。

- クラスレベルでのクラスサイズ効果
  - 13の学校をstratumとして考える
  - 68の教師を小さいクラス(Treatment)と普通サイズ(Control)のクラスに割り当て
- 生徒個人レベルでのクラスサイズ効果


### Stratified Randomized Experimentsでの回帰分析

$$Y_i^{obs} = \tau \cdot W_i + \sum_{j = 1}^J \beta(j) \cdot B_i(j) + \epsilon_i$$

ただし、
$$
B_i(j) \begin{cases}
1 & & iがjに所属する (jはstratum) \\
0 & & else
\end{cases}
$$
