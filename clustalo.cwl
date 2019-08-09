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
label: "Clustal Omega"
id: "clustalo"
baseCommand: clustalo.py

hints:
  DockerRequirement:
    dockerPull: ebiwp/webservice-clients

  email:
    type: string
      inputBinding:
      prefix: --email
    default: 'test@ebi.ac.uk'

  sequences:
    type: File
      inputBinding:
      prefix: --sequence

  stype:
    type: string
    inputBinding:
      prefix: --stype

  outfile:
    type: string
    inputBinding:
      prefix: --outfile
    default: 'clustalo_out'

  outformat:
    type: string
    inputBinding:
      prefix: --outformat
    default: 'aln-clustal_num'

outputs:
  clustalo_out:
    type: File
    outputBinding:
      glob: "*clustalo_out.aln-clustal_num*"

$schemas:
  - http://schema.org/docs/schema_org_rdfa.html

$namespaces:
  s: http://schema.org/
  edam: http://edamontology.org/

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-8728-9449
    s:email: mailto:www-prod@ebi.ac.uk
    s:name: Fábio Madeira (Web Production)
    s:worksFor:
    - class: s:Organization
      s:name: EMBL - European Bioinformatics Institute
      s:location: Hinxton, Cambridgeshire, CB10 1SD, UK
      s:department:
      - class: s:Organization
        s:name: Web Production

# s:citation: https://dx.doi.org/10.6084/m9.figshare.3115156.v2
# s:codeRepository: https://github.com/common-workflow-language/common-workflow-language
s:dateCreated: "2018-08-03"

# s:license:
s:license:
  - https://www.apache.org/licenses/LICENSE-2.0
  - https://spdx.org/licenses/Apache-2.0

s:copyrightHolder: "EMBL - European Bioinformatics Institute"
