function cell_data = mat_to_sparse_cell(data)

if isa(data,'single')
    data = double(data);
end

cell_data = {};
for cell_n = 1:size(data,1)
    cell_data{cell_n} = sparse(squeeze(data(cell_n,:,:)));
end

end