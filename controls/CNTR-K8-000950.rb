# encoding: UTF-8

control 'CNTR-K8-000950' do
  title "The Kubernetes etcd must enforce ports, protocols, and services (PPS)
that adhere to the Ports, Protocols, and Services Management Category Assurance
List (PPSM CAL)."
  desc  "Kubernetes etcd PPS must be controlled and conform to the PPSM CAL.
Those PPS that fall outside the PPSM CAL must be blocked. Instructions on the
PPSM can be found in DoD Instruction 8551.01 Policy."
  desc  'rationale', ''
  desc  'check', "
    Change to the /etc/kubernetes/manifests/ directory on the Kubernetes Master
Node. Run the command:
    grep kube-apiserver.manifest -I -etcd-servers *
    -edit etcd-main.manifest file:
    VIM <Manifest Name:
    Review  livenessProbe:
    HttpGet:
    Port:
    Review ports:
    - containerPort:
           hostPort:
    - containerPort:
           hostPort:
    Run Command:
    kubectl describe services –all-namespace
    Search labels for any apiserver names spaces.
    Port:

    Any manifest and namespace PPS configuration not in compliance with PPSM
CAL is a finding.

    Review the information systems documentation and interview the team, gain
an understanding of the etcd architecture, and determine applicable PPS. Any
PPS in the system documentation not in compliance with the CAL PPSM is a
finding. Any PPS not set in the system documentation is a finding.

    Review findings against the most recent PPSM CAL:
    https://cyber.mil/ppsm/cal/

    Verify etcd network boundary with the PPS associated with the CAL Assurance
Categories. Any PPS not in compliance with the CAL Assurance Category
requirements is a finding.
  "
  desc 'fix', "Amend any system documentation requiring revision. Update
Kubernetes etcd manifest and namespace PPS configuration to comply with PPSM
CAL."
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000142-CTR-000325'
  tag gid: 'CNTR-K8-000950'
  tag rid: 'CNTR-K8-000950_rule'
  tag stig_id: 'CNTR-K8-000950'
  tag fix_id: 'F-CNTR-K8-000950_fix'
  tag cci: ['CCI-000382']
  tag nist: ['CM-7 b']

  describe "Manually  Kubernetes etcd must enforces ports, protocols, and services (PPS)
  that adhere to the Ports, Protocols, and Services Management Category Assurance
  List (PPSM CAL)" do
    skip
  end
end
