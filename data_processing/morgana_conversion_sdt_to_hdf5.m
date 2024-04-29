% Conversion code for Morgana - sdt to txt

% load data

D = '\\inl-fps02\data\Ultrafast Bio- and Nanophotonics\06_Data\ExtreMed multiphoton microscope\Leonor_2023\Healthy\20230919_h460_control_day1'; % folder path
files = dir(fullfile(D, '*.sdt'));
files=files(~ismember({files.name},{'.','..'}));

% dir = '\\inl-fps02\data\Ultrafast Bio- and Nanophotonics\06_Data\ExtreMed multiphoton microscope\Leonor_2023\Healthy\20230919_h460_control_day1\txt_files';
yourFolder = '\\inl-fps02\data\Ultrafast Bio- and Nanophotonics\06_Data\ExtreMed multiphoton microscope\Leonor_2023\Healthy\20230919_h460_control_day1\txt_files';

% figure;
% numel(files)
for k = 1:length(files)
    
    fp = fullfile(D, files(k).name);
    sp = bh_readsetup(fp);
    data = bh_getdatablock(sp, 1);
    info = bh_blockinfo(sp, 1);
    meas = bh_getmeasdesc(sp, 1);
    serial = getserial(fp);
    data = double(data);
    
    % check if folder exists - if not create one inside the already existing
    % folder
    
    if not(isfolder(yourFolder))
        mkdir(yourFolder)
    end
    
    % save txt file with same name to folder
    
    t = string(files(k).name)+'.hdf5';
    filename = fullfile(yourFolder, t);
    h5create(filename, '/data', [256 256 256]);
    h5write(filename,'/data', data);
    
end





