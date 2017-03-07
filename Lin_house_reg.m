

clear ; close all; clc

data = load('HousingData.txt');
X = data(:,1:13);
Y = data(:,14);
m = length(Y);

%------------------------ Feature Normalization----------------------------%

%[X mu sigma] = Feature(X);

%------------------------------------------------------------------%
%fprintf('X...................');
%X

X = [ones(m,1),X];
initial_theta = zeros(size(X,2),1);

iterations = 5000;
alpha= 0.00000001;

%[theta J_hist] = grad(X,Y,theta,iterations,alpha);

options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost
lambda = 10;
 
[theta, cost] = ...
	fminunc(@(t)(costFunctionreg(t, X, Y,lambda)), initial_theta, options);



%figure;
%plot(1:numel(J_hist), J_hist, '-b', 'LineWidth', 2);
%xlabel('Number of iterations');
%ylabel('Cost J');

data =load('Test.txt');
X_test = data(:,1:13);
Y_test = data(:,14);

m_test = length(Y_test);


%for i = 1:m_test
	%X_test(i,:) = (X_test(i,:) - mu)./sigma;
%end


X_test = [ones(m_test,1), X_test];


%fprintf('X_test...................');
%X_test

sum((X_test*theta - Y_test).^2)/(2*m_test)

%-------------------------------------------Normal Equation----------------------------------------%
data = load('HousingData.txt');
X = data(:,1:13);
Y = data(:,14);

X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = Normalreg(X, Y,lambda)


data =load('Test.txt');
X_test = data(:,1:13);
Y_test = data(:,14);

X_test = [ones(m_test,1), X_test];


sum((X_test*theta - Y_test).^2)/(2*m_test)


