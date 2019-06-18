

load multiplier_ext.mat;

ext_tauk=multipl_tauk;
ext_tauw=multipl_tauw;

load multiplier_bench.mat;

bench_tauk=multipl_tauk;
bench_tauw=multipl_tauw;

irf_tauk_ext_qtl=mean(ext_tauk,2);
irf_tauw_ext_qtl=mean(ext_tauw,2);
irf_tauk_bench_qtl=mean(bench_tauk,2);
irf_tauw_bench_qtl=mean(bench_tauw,2);

result_tx_tauw=[[1:20]'  irf_tauw_bench_qtl irf_tauw_ext_qtl];
result_tx_tauk=[[1:20]'  irf_tauk_bench_qtl irf_tauk_ext_qtl];

disp('Table: Multiplier');
 disp('-------------------------------------------------------------------------');
 disp(' ');
 disp(sprintf('\t \t  \t \t Quarter 1 \t Quarter 4 \t Quarter 12 \t Quarter 20 '));
 disp(' ');
 disp('-------------------------------------------------------------------------');
disp(sprintf('Capital tax'));
 disp(' ');
 disp(sprintf('%s \t  %1.4f \t %1.4f \t %1.4f \t %1.4f ', 'Baseline model ',-result_tx_tauk(1,2), -result_tx_tauk(4,2),-result_tx_tauk(12,2),-result_tx_tauk(20,2)));    
 disp(sprintf('%s \t  %1.4f \t %1.4f \t %1.4f \t %1.4f ', 'Recommended model ',-result_tx_tauk(1,3), -result_tx_tauk(4,3),-result_tx_tauk(12,3),-result_tx_tauk(20,3)));    
 disp(sprintf('%s \t  %1.4f \t %1.4f \t %1.4f \t %1.4f ', 'Difference (in %)',1--result_tx_tauk(1,3)./-result_tx_tauk(1,2), 1--result_tx_tauk(4,3)./-result_tx_tauk(4,2),1--result_tx_tauk(12,3)./-result_tx_tauk(12,2),1--result_tx_tauk(20,3)./-result_tx_tauk(20,2)));    
 disp(' ');
 disp('-------------------------------------------------------------------------');
disp(sprintf('Labor tax'));
 disp(' ');
disp(sprintf('%s \t  %1.4f \t %1.4f \t %1.4f \t %1.4f ', 'Baseline model ',-result_tx_tauw(1,2), -result_tx_tauw(4,2),-result_tx_tauw(12,2),-result_tx_tauw(20,2)));    
 disp(sprintf('%s \t  %1.4f \t %1.4f \t %1.4f \t %1.4f ', 'Recommended model ',-result_tx_tauw(1,3), -result_tx_tauw(4,3),-result_tx_tauw(12,3),-result_tx_tauw(20,3)));    
 disp(sprintf('%s \t  %1.4f \t %1.4f \t %1.4f \t %1.4f ', 'Difference (in %)',1--result_tx_tauw(1,3)./-result_tx_tauw(1,2), 1--result_tx_tauw(4,3)./-result_tx_tauw(4,2),1--result_tx_tauw(12,3)./-result_tx_tauw(12,2),1--result_tx_tauw(20,3)./-result_tx_tauw(20,2)));    
 disp(' ');
 disp('-------------------------------------------------------------------------');