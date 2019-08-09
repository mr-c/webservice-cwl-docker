#!/usr/bin/env cwl-runner

# Copyright (C) 2019 EMBL - European Bioinformatics Institute
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#      http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cwlVersion: v1.0
class: CommandLineTool
label: "PHOBIUS"
id: "phobius"
baseCommand: phobius.py

hints:
  DockerRequirement:
    dockerPull: ebiwp/webservice-clients

  email:
    type: string
    doc: "Submitter's email"
    inputBinding:
      prefix: --email
    default: 'test@ebi.ac.uk'



  title:
    type: string?
    inputBinding:
      prefix: --title


  jobid:
    type: string?
    inputBinding:
      prefix: --jobid



  polljob:
    type: boolean?
    inputBinding:
      prefix: --polljob



  pollfreq:
    type: int?
    inputBinding:
      prefix: --pollFreq


  params:
    type: boolean?
    inputBinding:
      prefix: --params


  paramdetails:
    type: string?
    inputBinding:
      prefix: --paramDetail


    # Web Service Clients: Different Entries

  sequence:
    type: File?
    inputBinding:
      prefix: --sequence


  format-results:
    type:
        - "null"
        - type: enum
          symbols:
            - short
            - long
            - grp
            - raw
          inputBinding:
            prefix: --format

  input-file:
    type: File?


  outfile:
    type: string
    inputBinding:
      prefix: --outfile
    default: 'phobius_results'

  outformat:
    type: string
    inputBinding:
      prefix: --outformat
    default: 'out'

outputs:
  phobius_out:
    type: File
    outputBinding:
      glob: "*phobius_results.out*"
