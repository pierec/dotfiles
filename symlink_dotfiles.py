#!/usr/bin/env python

from __future__ import print_function
from __future__ import unicode_literals

import argparse
import errno
import os
import sys


def main():
    args = read_args()
    symlink_files_from_dir(
        src_dpath=args.src_dir,
        dst_dpath=args.dst_dir,
        force=args.force,
    )


def read_args():
    argparser = argparse.ArgumentParser()
    script_dir = os.path.abspath(
        os.path.dirname(sys.argv[0])
    )
    argparser.add_argument(
        '-s', '--src-dir',
        help='Source directory.',
        default=os.path.join(script_dir, 'home_root'),
    )
    argparser.add_argument(
        '-d', '--dst-dir',
        help='Destination directory.',
        default=os.path.expanduser('~'),
    )
    argparser.add_argument(
        '-f', '--force',
        help='Overwrite target files without asking.',
        action='store_true',
    )

    return argparser.parse_args()


def symlink_files_from_dir(src_dpath, dst_dpath, force=False):
    """Symlink all files found in source dir to analogous paths in destination
    dir. Create intermediate directories as needed."""
    for fpath in get_files(src_dpath):
        src_fpath = os.path.join(src_dpath, fpath)
        dst_fpath = os.path.join(dst_dpath, fpath)
        print('\'{}\' -> \'{}\''.format(src_fpath, dst_fpath))
        symlink(src_fpath, dst_fpath, force)


def get_files(path):
    for root, _, fnames in os.walk(path):
        for fname in fnames:
            yield os.path.relpath(
                os.path.join(root, fname),
                path,
            )


def symlink(src, dst, force=False):
    """Make a file symlink. Do nothing if destination file is already linked
    to source file. If a file would be overwritten, ask for user's
    confirmation, unless 'force' flag is set.

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

        if force:
            overwrite = True
        else:
            overwrite = ask('Overwrite \'{}\'?'.format(dst), default=True)

        if overwrite:
            os.unlink(dst)
            os.symlink(src, dst)


def makedirs(path, mode=0o755, exist_ok=True):
    try:
        os.makedirs(path, mode)
    except OSError as err:
        if not exist_ok and err.errno != errno.EEXIST:
            raise


def ask(msg, default=False):
    if default:
        yn_prompt = '[Y/n]'
    else:
        yn_prompt = '[y/N]'

    responses = {
        'y': True,
        'n': False,
        '': default,
    }

    prompt = '{} {}'.format(msg, yn_prompt)
    while True:
        print(prompt + ' ', end='')
        sys.stdout.flush()
        response = (
            sys.stdin.readline()
            .lower()
            .strip()
        )
        if response in responses:
            break

    return responses[response]

if __name__ == '__main__':
    main()
