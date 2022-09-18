function out = matlab2geoeas(DataIn);
% Transform Matlab array into GeoEAS column vector
%
%% DESCRIPTION: matlab2geoeas.m
% Function to transform a SINGLE matlab array (DataIn) into
% a single column in GeoEAS format that can be viewed using rastermap
%
%% SYNTAX:
%   out = matlab2geoeas(DataIn);
% 
%% INPUTS:
%   DataIn = input MATLAB array of Cartesian dimensions:
%            in 1D: (nx x 1)
%            in 2D: (nx x ny)       or (ny_rows x nx_cols)
%            in 3D: (nx x ny x nz)  or (ny_rows x nx_cols x nz_levels) 
%
%% OUTPUTS:
%   out    = output GeoEAS-formatted column of size:
%            in 1D: (nx x 1)
%            in 2D: (nx*ny x 1)
%            in 3D: (nx*ny*nz x 1)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SYNTAX:
%   out = matlab2geoeas(DataIn);

%% CREDITS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%                          Phaedon Kyriakidis                             %
%                       Department of Geography                           %
%               University of California Santa Barbara                    %
%                              May 2005                                   %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Get some input parameters
sizeDat = size(DataIn);
ngTot   = prod(sizeDat(:));
itmp = find(sizeDat==1);
sizeDat(itmp) = [];
ndim = length(sizeDat);

%% Proceed according to dimensionality
switch ndim
    case 1
        % Nothing to change
        out = DataIn;
    case 2
        out = reshape(rot90(DataIn,3),[ngTot 1]);
    case 3
        ngz  = sizeDat(3);
        ngxy = ngTot/ngz;
        out = permute( DataIn, [2 1 3] );
        out = fliplr(out(:,:));
        out = reshape(out,[ngxy ngz]);
        out = fliplr(out);
        out = out(:);
    otherwise
        error('ndim must be <= 3');
end

%% Finished