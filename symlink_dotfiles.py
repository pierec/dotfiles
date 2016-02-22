#!/usr/bin/env python2.7

from __future__ import print_function
from __future__ import unicode_literals

import argparse
import errno
import os
import sys


def main():
    args = read_args()
    symlink_files_from_dir(args.src_dir, args.dst_dir)


def read_args():
    argparser = argparse.ArgumentParser()
    script_dir = os.path.abspath(
        os.path.dirname(sys.argv[0])
    )
    argparser.add_argument(
        '--src-dir',
        help='Source dir.',
        default=os.path.join(script_dir, 'home_root')
    )
    argparser.add_argument(
        '--dst-dir',
        help='Destination dir.',
        default=os.path.expanduser('~'),
    )

    return argparser.parse_args()


def symlink_files_from_dir(src_dpath, dst_dpath):
    """Symlink all files found in source dir to analogous paths in destination
    dir. Create intermediate directories as needed."""
    for fpath in get_files(src_dpath):
        src_fpath = os.path.join(src_dpath, fpath)
        dst_fpath = os.path.join(dst_dpath, fpath)
        print('\'{}\' -> \'{}\''.format(src_fpath, dst_fpath))
        symlink(src_fpath, dst_fpath)


def get_files(path):
    for root, _, fnames in os.walk(path):
        for fname in fnames:
            yield os.path.relpath(
                os.path.join(root, fname),
                path,
            )


def symlink(src, dst):
    """Make a file symlink. Do nothing if destination file is already linked
    to source file. If a file would be overwritten, ask for user's
    confirmation.

    Missing intermediate directories will be created.
    """
    dst_canonical = os.path.realpath(dst)

    if dst_canonical == src:
        return

    makedirs(os.path.dirname(dst))
    try:
        os.symlink(src, dst)
    except OSError as err:
        if err.errno != errno.EEXIST:
            raise
        overwrite = ask('Overwrite \'{}\'?'.format(dst), default=True)
        if overwrite:
            os.unlink(dst)
            os.symlink(src, dst)


def makedirs(path, mode=0755, exist_ok=True):
    try:
        os.makedirs(path, mode)
    except OSError as err:
        if not exist_ok and err.errno != errno.EEXIST:
            raise


def ask(msg, default=True):
    if default:
        prompt = '[Y/n]'
    else:
        prompt = '[y/N]'

    responses = {
        'y': True,
        'n': False,
        '': default
    }

    print('{} {} '.format(msg), end='')

    while True:
        print(prompt + ' ', end='')
        response = raw_input().lower()
        if response in responses:
            break
        else:
            print('')

    return responses[response]

if __name__ == '__main__':
    main()
