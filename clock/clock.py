#!/usr/bin/env python3
"""
================================================================================
Script Name   : clock.py
Author        : CardonDev
Creation Date : 2023-12-21
Description   : A digital clock script that displays the current time in big
                numbers.
Usage:
    python3 digital_clock.py [options]

Options:
    -f, --format {12,24}   Time format: '12', '24'
    -t, --theme THEME      Color theme
                           Available themes: default, red, green, yellow, blue,
                           magenta, cyan, white, rainbow, animated
    -h, --help             Show this help message and exit

Example:
    python3 digital_clock.py -f 12 -t red

Revision History:
    Date        Author      Ref    Revision
    2023-12-21  CardonDev  1      Initial Release
================================================================================
"""

import sys
import time
import os
import argparse
from datetime import datetime

big_digits = {
    '0': [
        '  ###   ',
        ' #   #  ',
        '#     # ',
        '#     # ',
        '#     # ',
        ' #   #  ',
        '  ###   ',
    ],
    '1': [
        '   #    ',
        '  ##    ',
        '   #    ',
        '   #    ',
        '   #    ',
        '   #    ',
        '  ###   ',
    ],
    '2': [
        '  ###   ',
        ' #   #  ',
        '     #  ',
        '    #   ',
        '   #    ',
        '  #     ',
        ' ###### ',
    ],
    '3': [
        '  ###   ',
        ' #   #  ',
        '     #  ',
        '   ##   ',
        '     #  ',
        ' #   #  ',
        '  ###   ',
    ],
    '4': [
        '    #   ',
        '   ##   ',
        '  # #   ',
        ' #  #   ',
        ' ###### ',
        '    #   ',
        '    #   ',
    ],
    '5': [
        ' ###### ',
        ' #      ',
        ' #      ',
        ' #####  ',
        '      # ',
        ' #    # ',
        '  ####  ',
    ],
    '6': [
        '  ####  ',
        ' #      ',
        ' #      ',
        ' #####  ',
        ' #    # ',
        ' #    # ',
        '  ####  ',
    ],
    '7': [
        ' ###### ',
        '     #  ',
        '    #   ',
        '   #    ',
        '  #     ',
        '  #     ',
        '  #     ',
    ],
    '8': [
        '  ###   ',
        ' #   #  ',
        ' #   #  ',
        '  ###   ',
        ' #   #  ',
        ' #   #  ',
        '  ###   ',
    ],
    '9': [
        '  ####  ',
        ' #    # ',
        ' #    # ',
        '  ##### ',
        '      # ',
        '     #  ',
        ' ####   ',
    ],
    ':': [
        '   ',
        '   ',
        ' # ',
        '   ',
        ' # ',
        '   ',
        '   ',
    ],
    ' ': [
        '   ',
        '   ',
        '   ',
        '   ',
        '   ',
        '   ',
        '   ',
    ],
    'A': [
        '   ##   ',
        '  #  #  ',
        ' #    # ',
        ' ###### ',
        ' #    # ',
        ' #    # ',
        ' #    # ',
    ],
    'P': [
        ' #####  ',
        ' #    # ',
        ' #    # ',
        ' #####  ',
        ' #      ',
        ' #      ',
        ' #      ',
    ],
    'M': [
        ' #    # ',
        ' ##  ## ',
        ' # ## # ',
        ' #    # ',
        ' #    # ',
        ' #    # ',
        ' #    # ',
    ],
}

color_codes = {
    'default': '\033[0m',     
    'red': '\033[31m',         
    'green': '\033[32m',       
    'yellow': '\033[33m',      
    'blue': '\033[34m',       
    'magenta': '\033[35m',     
    'cyan': '\033[36m',        
    'white': '\033[37m',       
    'rainbow': None,           
    'animated': None,        
}

rainbow_colors = ['\033[31m', '\033[33m', '\033[32m', '\033[36m', '\033[34m', '\033[35m']

def clear_screen():
    """Clears the terminal screen."""
    os.system('cls' if os.name == 'nt' else 'clear')

def get_color(index=0):
    """Returns a color code from the rainbow_colors list based on the index."""
    return rainbow_colors[index % len(rainbow_colors)]

def digital_clock(time_format, theme):
    """Displays the digital clock with the specified time format and theme."""
    color_index = 0
    while True:
        now = datetime.now()
        if time_format == 12:
            time_str = now.strftime('%I:%M:%S %p')
        else:
            time_str = now.strftime('%H:%M:%S')

        lines = ['' for _ in range(7)]
        for char in time_str:
            digit = big_digits.get(char.upper(), [' ' * 7]*7)
            for i in range(7):
                lines[i] += digit[i] + '  '

        date_display = now.strftime('%A, %B %d, %Y').center(80)

        clear_screen()

        if theme == 'rainbow':
            for idx, line in enumerate(lines):
                colored_line = ''
                for i, c in enumerate(line):
                    if c != ' ':
                        colored_line += get_color(color_index + i) + c + '\033[0m'
                    else:
                        colored_line += ' '
                print(colored_line)
                color_index += 1
            print(date_display)
            color_index += 1
        elif theme == 'animated':
    
            color_keys = ['red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white']
            current_color = color_codes[color_keys[color_index % len(color_keys)]]
            print(f'{current_color}')
            for line in lines:
                print(line)
            print('\033[0m' + date_display)
            color_index += 1
        else:
            color = color_codes.get(theme, '\033[0m')
            print(f'{color}')
            for line in lines:
                print(line)
            print('\033[0m' + date_display)

        time.sleep(1)

def main():
    """Main function to parse arguments and start the digital clock."""
    parser = argparse.ArgumentParser(description='Digital Clock CLI')
    parser.add_argument('-f', '--format', choices=['12', '24'], default='24',
                        help="Time format: '12' for regular time, '24' for military time")
    parser.add_argument('-t', '--theme', choices=list(color_codes.keys()), default='default',
                        help='Color theme')
    args = parser.parse_args()

    time_format = int(args.format)
    theme = args.theme

    try:
        digital_clock(time_format, theme)
    except KeyboardInterrupt:
        clear_screen()
        sys.exit()

if __name__ == '__main__':
    main()
