function [X_train, Y_train, X_test, Y_test] = makeCrabs()
% Crabs data set from http://www.stats.ox.ac.uk/pub/PRNN/
% Xtrain: 80 * 5
% Y_train in {1,2} for male, female
% Xtest: 120*5
% Ytest in {1,2}

%
% First column: true label
% 0 = Blue male
% 1 = Blue female
% 2 = Orange Male
% 3 = Orange Female
%
crabs = [...
0  1  8.1  6.7 16.1 19.0  7.0;
0  2  8.8  7.7 18.1 20.8  7.4;
0  3  9.2  7.8 19.0 22.4  7.7;
0  4  9.6  7.9 20.1 23.1  8.2;
0  5  9.8  8.0 20.3 23.0  8.2;
0  6 10.8  9.0 23.0 26.5  9.8;
0  7 11.1  9.9 23.8 27.1  9.8;
0  8 11.6  9.1 24.5 28.4 10.4;
0  9 11.8  9.6 24.2 27.8  9.7;
0 10 11.8 10.5 25.2 29.3 10.3;
0 11 12.2 10.8 27.3 31.6 10.9;
0 12 12.3 11.0 26.8 31.5 11.4;
0 13 12.6 10.0 27.7 31.7 11.4;
0 14 12.8 10.2 27.2 31.8 10.9;
0 15 12.8 10.9 27.4 31.5 11.0;
0 16 12.9 11.0 26.8 30.9 11.4;
0 17 13.1 10.6 28.2 32.3 11.0;
0 18 13.1 10.9 28.3 32.4 11.2;
0 19 13.3 11.1 27.8 32.3 11.3;
0 20 13.9 11.1 29.2 33.3 12.1;
0 21 14.3 11.6 31.3 35.5 12.7;
0 22 14.6 11.3 31.9 36.4 13.7;
0 23 15.0 10.9 31.4 36.4 13.2;
0 24 15.0 11.5 32.4 37.0 13.4;
0 25 15.0 11.9 32.5 37.2 13.6;
0 26 15.2 12.1 32.3 36.7 13.6;
0 27 15.4 11.8 33.0 37.5 13.6;
0 28 15.7 12.6 35.8 40.3 14.5;
0 29 15.9 12.7 34.0 38.9 14.2;
0 30 16.1 11.6 33.8 39.0 14.4;
0 31 16.1 12.8 34.9 40.7 15.7;
0 32 16.2 13.3 36.0 41.7 15.4;
0 33 16.3 12.7 35.6 40.9 14.9;
0 34 16.4 13.0 35.7 41.8 15.2;
0 35 16.6 13.5 38.1 43.4 14.9;
0 36 16.8 12.8 36.2 41.8 14.9;
0 37 16.9 13.2 37.3 42.7 15.6;
0 38 17.1 12.6 36.4 42.0 15.1;
0 39 17.1 12.7 36.7 41.9 15.6;
0 40 17.2 13.5 37.6 43.9 16.1;
0 41 17.7 13.6 38.7 44.5 16.0;
0 42 17.9 14.1 39.7 44.6 16.8;
0 43 18.0 13.7 39.2 44.4 16.2;
0 44 18.8 15.8 42.1 49.0 17.8;
0 45 19.3 13.5 41.6 47.4 17.8;
0 46 19.3 13.8 40.9 46.5 16.8;
0 47 19.7 15.3 41.9 48.5 17.8;
0 48 19.8 14.2 43.2 49.7 18.6;
0 49 19.8 14.3 42.4 48.9 18.3;
0 50 21.3 15.7 47.1 54.6 20.0;
1  1  7.2  6.5 14.7 17.1  6.1;
1  2  9.0  8.5 19.3 22.7  7.7;
1  3  9.1  8.1 18.5 21.6  7.7;
1  4  9.1  8.2 19.2 22.2  7.7;
1  5  9.5  8.2 19.6 22.4  7.8;
1  6  9.8  8.9 20.4 23.9  8.8;
1  7 10.1  9.3 20.9 24.4  8.4;
1  8 10.3  9.5 21.3 24.7  8.9;
1  9 10.4  9.7 21.7 25.4  8.3;
1 10 10.8  9.5 22.5 26.3  9.1;
1 11 11.0  9.8 22.5 25.7  8.2;
1 12 11.2 10.0 22.8 26.9  9.4;
1 13 11.5 11.0 24.7 29.2 10.1;
1 14 11.6 11.0 24.6 28.5 10.4;
1 15 11.6 11.4 23.7 27.7 10.0;
1 16 11.7 10.6 24.9 28.5 10.4;
1 17 11.9 11.4 26.0 30.1 10.9;
1 18 12.0 10.7 24.6 28.9 10.5;
1 19 12.0 11.1 25.4 29.2 11.0;
1 20 12.6 12.2 26.1 31.6 11.2;
1 21 12.8 11.7 27.1 31.2 11.9;
1 22 12.8 12.2 26.7 31.1 11.1;
1 23 12.8 12.2 27.9 31.9 11.5;
1 24 13.0 11.4 27.3 31.8 11.3;
1 25 13.1 11.5 27.6 32.6 11.1;
1 26 13.2 12.2 27.9 32.1 11.5;
1 27 13.4 11.8 28.4 32.7 11.7;
1 28 13.7 12.5 28.6 33.8 11.9;
1 29 13.9 13.0 30.0 34.9 13.1;
1 30 14.7 12.5 30.1 34.7 12.5;
1 31 14.9 13.2 30.1 35.6 12.0;
1 32 15.0 13.8 31.7 36.9 14.0;
1 33 15.0 14.2 32.8 37.4 14.0;
1 34 15.1 13.3 31.8 36.3 13.5;
1 35 15.1 13.5 31.9 37.0 13.8;
1 36 15.1 13.8 31.7 36.6 13.0;
1 37 15.2 14.3 33.9 38.5 14.7;
1 38 15.3 14.2 32.6 38.3 13.8;
1 39 15.4 13.3 32.4 37.6 13.8;
1 40 15.5 13.8 33.4 38.7 14.7;
1 41 15.6 13.9 32.8 37.9 13.4;
1 42 15.6 14.7 33.9 39.5 14.3;
1 43 15.7 13.9 33.6 38.5 14.1;
1 44 15.8 15.0 34.5 40.3 15.3;
1 45 16.2 15.2 34.5 40.1 13.9;
1 46 16.4 14.0 34.2 39.8 15.2;
1 47 16.7 16.1 36.6 41.9 15.4;
1 48 17.4 16.9 38.2 44.1 16.6;
1 49 17.5 16.7 38.6 44.5 17.0;
1 50 19.2 16.5 40.9 47.9 18.1;
2  1  9.1  6.9 16.7 18.6  7.4;
2  2 10.2  8.2 20.2 22.2  9.0;
2  3 10.7  8.6 20.7 22.7  9.2;
2  4 11.4  9.0 22.7 24.8 10.1;
2  5 12.5  9.4 23.2 26.0 10.8;
2  6 12.5  9.4 24.2 27.0 11.2;
2  7 12.7 10.4 26.0 28.8 12.1;
2  8 13.2 11.0 27.1 30.4 12.2;
2  9 13.4 10.1 26.6 29.6 12.0;
2 10 13.7 11.0 27.5 30.5 12.2;
2 11 14.0 11.5 29.2 32.2 13.1;
2 12 14.1 10.4 28.9 31.8 13.5;
2 13 14.1 10.5 29.1 31.6 13.1;
2 14 14.1 10.7 28.7 31.9 13.3;
2 15 14.2 10.6 28.7 31.7 12.9;
2 16 14.2 10.7 27.8 30.9 12.7;
2 17 14.2 11.3 29.2 32.2 13.5;
2 18 14.6 11.3 29.9 33.5 12.8;
2 19 14.7 11.1 29.0 32.1 13.1;
2 20 15.1 11.4 30.2 33.3 14.0;
2 21 15.1 11.5 30.9 34.0 13.9;
2 22 15.4 11.1 30.2 33.6 13.5;
2 23 15.7 12.2 31.7 34.2 14.2;
2 24 16.2 11.8 32.3 35.3 14.7;
2 25 16.3 11.6 31.6 34.2 14.5;
2 26 17.1 12.6 35.0 38.9 15.7;
2 27 17.4 12.8 36.1 39.5 16.2;
2 28 17.5 12.0 34.4 37.3 15.3;
2 29 17.5 12.7 34.6 38.4 16.1;
2 30 17.8 12.5 36.0 39.8 16.7;
2 31 17.9 12.9 36.9 40.9 16.5;
2 32 18.0 13.4 36.7 41.3 17.1;
2 33 18.2 13.7 38.8 42.7 17.2;
2 34 18.4 13.4 37.9 42.2 17.7;
2 35 18.6 13.4 37.8 41.9 17.3;
2 36 18.6 13.5 36.9 40.2 17.0;
2 37 18.8 13.4 37.2 41.1 17.5;
2 38 18.8 13.8 39.2 43.3 17.9;
2 39 19.4 14.1 39.1 43.2 17.8;
2 40 19.4 14.4 39.8 44.3 17.9;
2 41 20.1 13.7 40.6 44.5 18.0;
2 42 20.6 14.4 42.8 46.5 19.6;
2 43 21.0 15.0 42.9 47.2 19.4;
2 44 21.5 15.5 45.5 49.7 20.9;
2 45 21.6 15.4 45.7 49.7 20.6;
2 46 21.6 14.8 43.4 48.2 20.1;
2 47 21.9 15.7 45.4 51.0 21.1;
2 48 22.1 15.8 44.6 49.6 20.5;
2 49 23.0 16.8 47.2 52.1 21.5;
2 50 23.1 15.7 47.6 52.8 21.6;
3  1 10.7  9.7 21.4 24.0  9.8;
3  2 11.4  9.2 21.7 24.1  9.7;
3  3 12.5 10.0 24.1 27.0 10.9;
3  4 12.6 11.5 25.0 28.1 11.5;
3  5 12.9 11.2 25.8 29.1 11.9;
3  6 14.0 11.9 27.0 31.4 12.6;
3  7 14.0 12.8 28.8 32.4 12.7;
3  8 14.3 12.2 28.1 31.8 12.5;
3  9 14.7 13.2 29.6 33.4 12.9;
3 10 14.9 13.0 30.0 33.7 13.3;
3 11 15.0 12.3 30.1 33.3 14.0;
3 12 15.6 13.5 31.2 35.1 14.1;
3 13 15.6 14.0 31.6 35.3 13.8;
3 14 15.6 14.1 31.0 34.5 13.8;
3 15 15.7 13.6 31.0 34.8 13.8;
3 16 16.1 13.6 31.6 36.0 14.0;
3 17 16.1 13.7 31.4 36.1 13.9;
3 18 16.2 14.0 31.6 35.6 13.7;
3 19 16.7 14.3 32.3 37.0 14.7;
3 20 17.1 14.5 33.1 37.2 14.6;
3 21 17.5 14.3 34.5 39.6 15.6;
3 22 17.5 14.4 34.5 39.0 16.0;
3 23 17.5 14.7 33.3 37.6 14.6;
3 24 17.6 14.0 34.0 38.6 15.5;
3 25 18.0 14.9 34.7 39.5 15.7;
3 26 18.0 16.3 37.9 43.0 17.2;
3 27 18.3 15.7 35.1 40.5 16.1;
3 28 18.4 15.5 35.6 40.0 15.9;
3 29 18.4 15.7 36.5 41.6 16.4;
3 30 18.5 14.6 37.0 42.0 16.6;
3 31 18.6 14.5 34.7 39.4 15.0;
3 32 18.8 15.2 35.8 40.5 16.6;
3 33 18.9 16.7 36.3 41.7 15.3;
3 34 19.1 16.0 37.8 42.3 16.8;
3 35 19.1 16.3 37.9 42.6 17.2;
3 36 19.7 16.7 39.9 43.6 18.2;
3 37 19.9 16.6 39.4 43.9 17.9;
3 38 19.9 17.9 40.1 46.4 17.9;
3 39 20.0 16.7 40.4 45.1 17.7;
3 40 20.1 17.2 39.8 44.1 18.6;
3 41 20.3 16.0 39.4 44.1 18.0;
3 42 20.5 17.5 40.0 45.5 19.2;
3 43 20.6 17.5 41.5 46.2 19.2;
3 44 20.9 16.5 39.9 44.7 17.5;
3 45 21.3 18.4 43.8 48.4 20.0;
3 46 21.4 18.0 41.2 46.2 18.7;
3 47 21.7 17.1 41.7 47.2 19.6;
3 48 21.9 17.2 42.6 47.4 19.5;
3 49 22.5 17.2 43.0 48.7 19.8;
3 50 23.1 20.2 46.2 52.5 21.1];
%
% the second column is just the sample number
% so we need to remove it
crabs = [crabs(:,1) crabs(:,3:7)];
%
% We are only interested in male/female classification,
% so we select the data accordingly
males = [find(crabs(:,1)==0)  find(crabs(:,1)==2)];
females = [find(crabs(:,1)==1)  find(crabs(:,1)==3)];
% and set the training labels 
crabs(males,1) = 1;
crabs(females,1) = 0;


% set the standard training data (the first 
% 20 of each gender/color
X_train = [crabs(1:20,2:6); crabs(51:70,2:6); ...
        crabs(101:120,2:6); crabs(151:170,2:6)];
Y_train = [crabs(1:20,1); crabs(51:70,1); ...
        crabs(101:120,1); crabs(151:170,1)];
% set as test data the remaining samples
X_test = [crabs(21:50,2:6); crabs(71:100,2:6);...
        crabs(121:150,2:6); crabs(171:200,2:6)];
Y_test =  [crabs(21:50,1); crabs(71:100,1);...
      crabs(121:150,1); crabs(171:200,1)];
Y_train(find(Y_train==0))=2;Y_test(find(Y_test==0))=2;


end