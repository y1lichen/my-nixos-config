{ config, pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;
    home.packages = with pkgs; [
      xclip 
      wl-clipboard
    ];

    # 設定配置內容
    extraConfig = ''
      unbind C-b               # 解除預設 prefix (Ctrl+b)
      set -g prefix C-a        # 改成 Ctrl+a
      bind C-a send-prefix

      unbind %
      unbind '"'
      bind | split-window -h    # 垂直分割（左右）
      bind - split-window -v    # 水平分割（上下）

      # --- Pane 導航（使用 Ctrl+hjkl）---
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 2
      bind -r K resize-pane -U 2
      bind -r L resize-pane -R 5

      set -g mouse on             # 開啟滑鼠支援
      setw -g mode-keys vi        # vi-style copy mode
      set -g history-limit 10000  # scrollback 行數
      set -g base-index 1         # 視窗編號從 1 開始
      setw -g pane-base-index 1   # pane 編號從 1 開始

      set -g status-bg colour235
      set -g status-fg colour136
      set -g status-left ' #[fg=green]#S #[default]'
      set -g status-right '#[fg=yellow]%Y-%m-%d #[fg=cyan]%H:%M #[default]'

      set-option -g set-clipboard on
      setw -g mode-keys vi
      
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy || xclip -selection clipboard -i"
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy || xclip -selection clipboard -i"
    '';
  };
}