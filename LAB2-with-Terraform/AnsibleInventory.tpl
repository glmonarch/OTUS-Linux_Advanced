[cluster-nodes]
%{ for index, ip_address in ip_address ~}
${ip_address}
%{ endfor ~}