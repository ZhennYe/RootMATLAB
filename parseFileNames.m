function [pars,vals]=parseFileNames(fname,varargin)
% if second argument exists, and is equal to 1, strips file extension
% spk_#1_smrt_#2_gait_#3_rob_#4_v_#5
% 
% #1= speaker position in degrees
% #2= smarticle direction defined by front face
% #3= gait of particles (1=full square)
% #4= number of robots
% #5= iteration of that run

if(nargin>1&&varargin{1}==1)
[~,fname,~]=fileparts(fname);
end

%get strings
expression = '[a-z A-Z]*';
pars = regexp(fname,expression,'match');

expression = '[0-9.]*';
vals=regexp(fname,expression,'match');
vals=str2double(vals);

% C = strsplit(str,delimiter)


% function []=parseFileNames(a,b,c,d,e)
% zz=sprintf('spk_%d_smrt_%d_gait_%d_rob_%d_v_%d',a,b,c,d,e);
% clipboard('copy',zz)