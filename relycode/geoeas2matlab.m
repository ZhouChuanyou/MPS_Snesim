function Out = geoeas2matlab(datain,gridspecs);
% Transform GeoEas array into Matlab image
%
%% DESCRIPTION: geoeas2matlab.m
% Function to transform a SINGLE GoeEas-formatted raster (datain)
% i.e., a single column, to a MATLAB array that can be viewed using 
% imagesc (in 2D) or slice (in 3D).
%
%% SYNTAX:
%   Out = geoeas2matlab(datain,gridspecs);
% 
%% INPUTS:
%   datain    = input GeoEas-formatted raster of dimensions:
%               in 1D: (nx x 1)
%               in 2D: (nx*ny x 1)
%               in 3D: (nx*ny*nz x 1)
%   gridspecs = (1 x ndim) vector with raster size
%               in 1D: [nx]
%               in 2D: [nx ny] 
%               in 3D: [nx ny nz]
%
%% OUTPUTS:
%   Out       = output MATLAB-image array of dimensions:
%               in 1D: (nx x 1)
%               in 2D: (ny x nx) 
%               in 3D: (ny x nx x nz)
%
%% NOTES: 
%   In 3D, z increases upwards
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SYNTAX:
%   Out = geoeas2matlab(datain,gridspecs);

%% CREDITS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%                          Phaedon Kyriakidis                             %
%                       Department of Geography                           %
%               University of California Santa Barbara                    %
%                              May 2005                                   %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Some error checking
ndim = length(gridspecs);
if size(datain,2) ~= 1
   error('datain must be a column vector');
end
if length(datain) ~= prod(gridspecs(:));
   error('Length of datain incompatible with gridspecs');
end
% if any(gridspecs == 1)
%     error('Found a 1 in gridspecs');
% end

%% Proceed according to dimensionality
switch ndim
case 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 1D case

Out = datain;

case 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2D case

nx = gridspecs(1);
ny = gridspecs(2);

Tmp = reshape(datain,nx,ny);
Tmp = permute(Tmp, [2 1 3]);
Out = Tmp(ny:-1:1,:); 

case 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3D case

nx = gridspecs(1);
ny = gridspecs(2);
nz = gridspecs(3);

Tmp = reshape(datain,nx,ny,nz);
Tmp = permute(Tmp, [2 1 3]);
Out = Tmp(ny:-1:1,:,:);

end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end switch ndim