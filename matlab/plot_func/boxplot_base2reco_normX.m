%% load file
clear; close all; clc;

% load norm_X version data
cd 'E:\B2X\2차년도\03_pilot\CODE\matlab\extracted_data\base2reco_ratio\norm_X'
load("s0.mat");
load("N020.mat");
load("N100.mat");
load("S020.mat");
load("S100.mat");

% 1. 20Hz vs 100Hz
%                                                      Figure(gamma)
%
%     subplot1(frontal)       subplot2(central)      subplot3(parietal)     subplot4(occipital)      subplot5(temporal)
%   --------------------    --------------------    --------------------    --------------------    --------------------
%   |           100Hz  |    |                  |    |                  |    |                  |    |                  |
%   |   20Hz    ----   |    |                  |    |                  |    |                  |    |                  |
%   |   ----    |  |   |    |                  |    |                  |    |                  |    |                  |
%   |   |  |    |  |   |    |                  |    |                  |    |                  |    |                  |
%   |   |  |    |  |   |    |                  |    |                  |    |                  |    |                  |
%   |   |  |    ----   |    |                  |    |                  |    |                  |    |                  |
%   |   ----           |    |                  |    |                  |    |                  |    |                  |
%   --------------------    --------------------    --------------------    --------------------    --------------------

% 2. Biphasic vs Symmetric Biphasic
%                                                      Figure(gamma)
%
%        subplot1(frontal)           subplot2(central)       subplot3(parietal)      subplot4(occipital)      subplot5(temporal)
%   ----------------------------    --------------------    --------------------    --------------------    --------------------
%   |              Symmetric   |    |                  |    |                  |    |                  |    |                  |
%   |                Biphasic  |    |                  |    |                  |    |                  |    |                  |
%   |   Biphasic      ----     |    |                  |    |                  |    |                  |    |                  |
%   |     ----        |  |     |    |                  |    |                  |    |                  |    |                  |
%   |     |  |        |  |     |    |                  |    |                  |    |                  |    |                  |
%   |     |  |        |  |     |    |                  |    |                  |    |                  |    |                  |
%   |     |  |        ----     |    |                  |    |                  |    |                  |    |                  |
%   |     ----                 |    |                  |    |                  |    |                  |    |                  |
%   ----------------------------    --------------------    --------------------    --------------------    --------------------


band_names = {'gamma', 'beta', 'alpha', 'theta', 'delta'};
g_names = {'frontal', 'central', 'parietal', 'occipital', 'temporal'};

% 20Hz vs 100Hz
S020_vs_S100(band_names, g_names, N020, N100, S020, S100);
N020_vs_N100(band_names, g_names, N020, N100, S020, S100);

% biphasic vs symmetric biphasic
S020_vs_N020(band_names, g_names, N020, N100, S020, S100);
S100_vs_N100(band_names, g_names, N020, N100, S020, S100);

function [] = S020_vs_S100(band_names, g_names, N020, N100, S020, S100)
    %     1.1 S020 vs S100
    for band_i = 1 : length(band_names)
        figure;
        t = tiledlayout(1,5); sgtitle('20Hz vs 100Hz for Symmetric Biphasic as base2reco ratio', 'FontSize', 20);
        box_label = {'20Hz', '100Hz'};
  
        % frontal
        nexttile; 
        Hz_20 = getfield(S020, 'frontal', band_names{band_i});
        Hz_100 = getfield(S100, 'frontal', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);
        title(['Frontal\_', band_names{band_i}], 'FontSize', 15); 
    
        % central
        nexttile; 
        Hz_20 = getfield(S020, 'central', band_names{band_i});
        Hz_100 = getfield(S100, 'central', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);
        title(['Central\_', band_names{band_i}], 'FontSize', 15);
    
        % parietal
        nexttile; 
        Hz_20 = getfield(S020, 'parietal', band_names{band_i});
        Hz_100 = getfield(S100, 'parietal', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);
        title(['Parietal\_', band_names{band_i}], 'FontSize', 15);
    
        % occipital
        nexttile; 
        Hz_20 = getfield(S020, 'occipital', band_names{band_i});
        Hz_100 = getfield(S100, 'occipital', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);
        title(['Occipital\_', band_names{band_i}], 'FontSize', 15);
        
        % temporal
        nexttile;
        Hz_20 = getfield(S020, 'temporal', band_names{band_i});
        Hz_100 = getfield(S100, 'temporal', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);    
        title(['Temporal\_', band_names{band_i}], 'FontSize', 15);
    
        t.Padding = 'compact';
    end
end

function [] = N020_vs_N100(band_names, g_names, N020, N100, S020, S100)
    %     1.2 N020 vs N100
    for band_i = 1 : length(band_names)
        figure;
        t = tiledlayout(1,5); sgtitle('20Hz vs 100Hz for Unsymmetric Biphasic as base2reco ratio', 'FontSize', 20);
        box_label = {'20Hz', '100Hz'};
    
        % frontal
        nexttile; 
        Hz_20 = getfield(N020, 'frontal', band_names{band_i});
        Hz_100 = getfield(N100, 'frontal', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);
        title(['Frontal\_', band_names{band_i}], 'FontSize', 15); 
    
        % central
        nexttile; 
        Hz_20 = getfield(N020, 'central', band_names{band_i});
        Hz_100 = getfield(N100, 'central', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);
        title(['Central\_', band_names{band_i}], 'FontSize', 15);
    
        % parietal
        nexttile; 
        Hz_20 = getfield(N020, 'parietal', band_names{band_i});
        Hz_100 = getfield(N100, 'parietal', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);
        title(['Parietal\_', band_names{band_i}], 'FontSize', 15);
    
        % occipital
        nexttile; 
        Hz_20 = getfield(N020, 'occipital', band_names{band_i});
        Hz_100 = getfield(N100, 'occipital', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);
        title(['Occipital\_', band_names{band_i}], 'FontSize', 15);
        
        % temporal
        nexttile;
        Hz_20 = getfield(N020, 'temporal', band_names{band_i});
        Hz_100 = getfield(N100, 'temporal', band_names{band_i});
        h1 = boxplot([Hz_20'; Hz_100'], [ones(length(Hz_20),1); 2*ones(length(Hz_100),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, Hz_20, Hz_100);
        set(gca, 'fontsize', 20);    
        title(['Temporal\_', band_names{band_i}], 'FontSize', 15);
    
        t.Padding = 'compact';
    end
end

function [] = S020_vs_N020(band_names, g_names, N020, N100, S020, S100)
    %     2.1 S020 vs N020
    for band_i = 1 : length(band_names)
        figure;
        t = tiledlayout(1,5); sgtitle('Biphasic vs Symmetric Biphasic for 20Hz as base2reco ratio', 'FontSize', 20);
        box_label = {'biphasic', 'sym_biphasic'};
    
        % frontal
        nexttile; 
        biphasic = getfield(S020, 'frontal', band_names{band_i});
        sym_biphasic = getfield(N020, 'frontal', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);
        title(['Frontal\_', band_names{band_i}], 'FontSize', 15); 
    
        % central
        nexttile; 
        biphasic = getfield(S020, 'central', band_names{band_i});
        sym_biphasic = getfield(N020, 'central', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);
        title(['Central\_', band_names{band_i}], 'FontSize', 15);
    
        % parietal
        nexttile; 
        biphasic = getfield(S020, 'parietal', band_names{band_i});
        sym_biphasic = getfield(N020, 'parietal', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);
        title(['Parietal\_', band_names{band_i}], 'FontSize', 15);
    
        % occipital
        nexttile; 
        biphasic = getfield(S020, 'occipital', band_names{band_i});
        sym_biphasic = getfield(N020, 'occipital', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);
        title(['Occipital\_', band_names{band_i}], 'FontSize', 15);
        
        % temporal
        nexttile;
        biphasic = getfield(S020, 'temporal', band_names{band_i});
        sym_biphasic = getfield(N020, 'temporal', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);    
        title(['Temporal\_', band_names{band_i}], 'FontSize', 15);
    
        t.Padding = 'compact';
    end
end

function [] = S100_vs_N100(band_names, g_names, N020, N100, S020, S100)
    %     2.2 S100 vs N100
    for band_i = 1 : length(band_names)
        figure;
        t = tiledlayout(1,5); sgtitle('Biphasic vs Symmetric Biphasic for 100Hz as base2reco ratio', 'FontSize', 20);
        box_label = {'biphasic', 'sym_biphasic'};
    
        % frontal
        nexttile; 
        biphasic = getfield(S100, 'frontal', band_names{band_i});
        sym_biphasic = getfield(N100, 'frontal', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);
        title(['Frontal\_', band_names{band_i}], 'FontSize', 15); 
    
        % central
        nexttile; 
        biphasic = getfield(S100, 'central', band_names{band_i});
        sym_biphasic = getfield(N100, 'central', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);
        title(['Central\_', band_names{band_i}], 'FontSize', 15);
    
        % parietal
        nexttile; 
        biphasic = getfield(S100, 'parietal', band_names{band_i});
        sym_biphasic = getfield(N100, 'parietal', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);
        title(['Parietal\_', band_names{band_i}], 'FontSize', 15);
    
        % occipital
        nexttile; 
        biphasic = getfield(S100, 'occipital', band_names{band_i});
        sym_biphasic = getfield(N100, 'occipital', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);
        title(['Occipital\_', band_names{band_i}], 'FontSize', 15);
        
        % temporal
        nexttile;
        biphasic = getfield(S100, 'temporal', band_names{band_i});
        sym_biphasic = getfield(N100, 'temporal', band_names{band_i});
        h1 = boxplot([biphasic'; sym_biphasic'], [ones(length(biphasic),1); 2*ones(length(sym_biphasic),1)], 'Labels', box_label); hold on;
        boxplot_modification(h1, biphasic, sym_biphasic);
        set(gca, 'fontsize', 20);    
        title(['Temporal\_', band_names{band_i}], 'FontSize', 15);
    
        t.Padding = 'compact';
    end
end

function [q10, q25, q75, q90] = getQuantile(data)
q = quantile(data, [0.1 0.25 0.75 0.9]);
q10=q(1); q25=q(2); q75=q(3); q90=q(4);
end

function [] = boxplot_modification(h, data1, data2)
        % boxplot modification
        % modify the figure properties (set the YData property)  
        % h(5,1) correspond the blue box  
        % h(1,1) correspond the upper whisker  
        % h(2,1) correspond the lower whisker
        [q10, q25, q75, q90] = getQuantile(data1);
        set(h(5,1), 'YData', [q10 q90 q90 q10 q10]);% blue box  
        upWhisker = get(h(1,1), 'YData');  
        set(h(1,1), 'YData', [q90 upWhisker(2)])   
        dwWhisker = get(h(2,1), 'YData');  
        set(h(2,1), 'YData', [dwWhisker(1) q10]) 
    
        [q10, q25, q75, q90] = getQuantile(data2);
        set(h(5,2), 'YData', [q10 q90 q90 q10 q10]);
        upWhisker = get(h(1,1), 'YData');  
        set(h(1,2), 'YData', [q90 upWhisker(2)])   
        dwWhisker = get(h(2,1), 'YData');  
        set(h(2,2), 'YData', [dwWhisker(1) q10]) 
end
