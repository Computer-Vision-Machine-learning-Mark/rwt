function test_suite = test_mrdwt
initTestSuite;

function test_mrdwt_1
  x = makesig('Leopold',8);
  h = daubcqf(4,'min');
  L = 1;
  [yl, yh, L] = mrdwt(x, h, L);
  yl_corr = [0.8365  0.4830 0 0 0 0 -0.1294 0.2241];
  yh_corr = [-0.2241 -0.1294 0 0 0 0 -0.4830 0.8365];
  L_corr = 1;
assertVectorsAlmostEqual(yl, yl_corr, 'relative', 0.001);
assertVectorsAlmostEqual(yh, yh_corr, 'relative', 0.001);
assertEqual(L, L_corr);

function test_mrdwt_2
  x = [1 3 5 2; 3 4 8 1; 3 9 2 0; 1 2 3 0];
  h = daubcqf(4, 'min');
  [yl, yh, L] = mrdwt(x, h, 1);
  yl_corr = [
      9.0111   10.7799    5.8795    4.1107;
     11.1393    8.7766    2.5502    4.9130;
      6.9465    5.7578    1.6630    2.8517;
      4.8182    7.7611    4.9922    2.0494];
  yh_corr = [
      4.5724    0.4285   -1.8828    2.2611    4.8714   -3.1026   -1.7978    0.0290   -2.9620   -1.1818   -1.1295    5.2733;
     -2.4441   -2.4318   -1.4465   -1.4587    1.8861   -4.2488   -1.9776    4.3403   -0.0233    0.0356    0.9498   -0.9620;
     -1.7488   -0.5870    0.5592   -0.6026    1.1663   -2.3550   -1.7398    2.9285   -0.6965    1.8583   -0.7120   -0.4498;
     -0.3795    2.5903    2.7700   -0.1998    4.1516   -1.2087   -1.5601   -1.3828    3.6818   -0.7120    0.8917   -3.8615];
assertVectorsAlmostEqual(yl, yl_corr, 'relative', 0.001);
assertVectorsAlmostEqual(yh, yh_corr, 'relative', 0.001);
