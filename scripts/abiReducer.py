#!/usr/bin/python3.5

import argparse
import glob
import json
import os.path

parser = argparse.ArgumentParser()
parser.add_argument('input', help='input directory')
parser.add_argument('output', help='output directory')
args = parser.parse_args()

files = glob.glob(args.input + '/*.json')

if not os.path.isdir(args.output):
  os.makedirs(args.output)

for path in files:
  with open(path, 'r') as f:
    contents = json.loads(f.read())
  result = {}
  result['abi'] = contents['abi']
  result['networks'] = contents['networks']
  basename = os.path.basename(path)
  out_path = os.path.join(args.output, basename)
  with open(out_path, 'w') as f:
    f.write(json.dumps(result))