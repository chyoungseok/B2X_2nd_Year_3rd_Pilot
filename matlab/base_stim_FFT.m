% custom code using EEGLAB function
% base stim FFT plot


%% Default Setting
close all; clear; clc;
% add EEGLAB path
addpath 'D:\B2X\2차년도\03_pilot\CODE\matlab\eeglab2021.1'
% eeglab;
close all; clear; clc;

% Choose subjects who are going to be analyzed
subjcet_path = 'D:\B2X\2차년도\03_pilot\subject_data';
choose_sub = 10:20; 
% choose_sub = 10;
f = dir(subjcet_path);
f = f(3:sum([f.isdir]));
if sum(choose_sub) > 0
    f = f(choose_sub);
end

fprintf('Selected Subjects: ');
for mat_i = 1 : length(f)
    fprintf('%s ', f(mat_i).name);
end
disp(' ');

% naming
stim_param_names =  {'S020', 'N020', 'S100', 'N100'}; % ppt에 기록하는 순서대로 배치

% spectopo() option setting
% percent_data = {'100'}; % percent data tom sample (1 ~ 100)
% scalp_freq = {'10 20 30 40 50'}; % frequencies to plot as scalp maps (Hz)
% freq_range = {'2 60'}; % plotting frequency range [lo_Hz Hi_Hz] 
% scalp_map = {'''electrodes'', ''on'''};

%% 1. load EEGSET
for s_i = 1 : length(f)
    for stim_params_i = 1 : length(stim_param_names)
        base_path = dir([f(s_i).folder, '\', f(s_i).name, '\EEG\EEGset\*_', stim_param_names{stim_params_i}, '_*_base.set']);
        stim_path = dir([f(s_i).folder, '\', f(s_i).name, '\EEG\EEGset\*_', stim_param_names{stim_params_i}, '_*_stim.set']);

        EEG_base = pop_loadset([base_path.folder, '\', base_path.name]);
        EEG_stim = pop_loadset([base_path.folder, '\', stim_path.name]);

        % Plotting log FFT
        % call pop_spectopo()
        warning('off');
        mkdir(['D:\B2X\2차년도\03_pilot\stim artifact 정리\base_stim_figures\', f(s_i).name]);
        warning('on');
        savepath = ['D:\B2X\2차년도\03_pilot\stim artifact 정리\base_stim_figures\', f(s_i).name];

        pop_spectopo(EEG_base, 1);
        hold on; sgtitle([f(s_i).name(1:2), '\_', f(s_i).name(4:end), '\_', stim_param_names{stim_params_i}, '\_baseline'], 'FontSize', 20);
        saveas(gcf, [savepath, '\', stim_param_names{stim_params_i}, '_base.png'])
        pop_spectopo(EEG_stim, 1);
        hold on; sgtitle([f(s_i).name(1:2), '\_', f(s_i).name(4:end), '\_', stim_param_names{stim_params_i}, '\_stimulation'], 'FontSize', 20);
        saveas(gcf, [savepath, '\', stim_param_names{stim_params_i}, '_stim.png'])
        close all;
    end
end

%% 2. plot FFT using spectopo()
