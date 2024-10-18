% Set arguments
data_dir = '/data_dir/data';
runs = {'1', '2', '3', '4'};
microns_per_pixel = 1.46;
model='Centroid distance';

save_directory = fullfile(data_dir, 'CellReg', [runs{:}]);
if ~exist(save_directory,'dir')
    mkdir(save_directory);
end

% Create paths
file_names = cell(numel(runs), 1);
for file_num = 1:length(file_names)
    [~, session_date, ~] = fileparts(data_dir);
    file_names{file_num} = fullfile(data_dir, ['ROI_', runs{file_num}]);
end

% Call CellReg
cell_to_index_map = register_cells(file_names', microns_per_pixel, model, save_directory);

% Save output to file
save(fullfile(save_directory, 'cell_to_index_map'), "cell_to_index_map");

