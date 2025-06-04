#!/usr/bin/env python3

import qutebrowser.api

def main():
    tabs = [(i, tab.url().toString(), tab.title())
            for i, tab in enumerate(qutebrowser.api.current_window.tabs)]
    tabs_sorted = sorted(tabs, key=lambda t: t[2])  # Sort by title

    for index, (original_index, _, _) in enumerate(tabs_sorted):
        qutebrowser.api.current_window.move_tab(original_index, index)
