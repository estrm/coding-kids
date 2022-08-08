#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import os

def main():
    TYPO_DICT_FILE = "./spelling.txt"

    dir_name = "."
    allfiles = list()
    for (dir_path, dir_names, filenames) in os.walk(dir_name):
        allfiles += [os.path.join(dir_path, file) for file in filenames]
    allfiles.remove(TYPO_DICT_FILE)
    print(allfiles)

    with open(TYPO_DICT_FILE) as file:
        for line in file:
            # print(line)
            mistake_word = line.split("||", 1)
            for myfile in allfiles:
                with open(myfile) as file:
                    if mistake_word[0] in file.readlines():
                        print(mistake_word[0])

if __name__ == '__main__':
    main()