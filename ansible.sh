#!/usr/bin/env bash

set -euo pipefail

cmd=${ANSIBLE_COMMAND:-}
if [[ -z "$cmd" ]]; then
  cmd=${0##*/}
fi

case "$cmd" in
  # Available commands
  "ansible" \
    | "ansible-playbook" \
    | "ansible-vault" \
    | "ansible-galaxy" \
    | "ansible-console" \
    | "ansible-config" \
    | "ansible-doc" \
    | "ansible-inventory" \
    | "ansible-pull" \
    )
    ;;
  * )
    cmd="ansible-playbook" # Default command
    ;;
esac

exec docker run -it --rm progrhyme/ansible:2.4.2.0 $cmd "$@"

echo "[ERROR] Failed to exec docker command!" >2

exit 1

: <<'__EOF__'

=encoding utf8

=head1 NAME

B<ansible.sh> - Exec dockerized ansible command

=head1 SYNOPSYS

    ansible.sh playbook.yml
    ANSIBLE_COMMAND=ansible-galaxy ansible.sh init

    ln -s ansible.sh ansible-console
    ansible-console

=head1 DESCRIPTION

Wrapper script to execute L<Ansible|https://www.ansible.com/> command through
Docker container.

=head1 SEE ALSO

L<https://hub.docker.com/r/progrhyme/ansible/>,
L<https://github.com/progrhyme/ansible-docker>

=head1 AUTHORS

IKEDA Kiyoshi E<lt>progrhyme@gmail.comE<gt>

=cut

__EOF__
