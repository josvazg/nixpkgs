{ lib
, buildGoModule
, fetchFromGitHub
, libpcap
}:

buildGoModule rec {
  pname = "naabu";
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "projectdiscovery";
    repo = "naabu";
    rev = "v${version}";
    sha256 = "sha256-o+5UOyFg1jhFmBDtkVPgJVk50fPt0uxvV6qiPrRtQZw=";
  };

  vendorSha256 = "sha256-Y7eQeoTt0TM4ZKWKVbltYY+k9Vq0TroVywQduwvlLQg=";

  buildInputs = [
    libpcap
  ];

  modRoot = "./v2";

  subPackages = [
    "cmd/naabu/"
  ];

  meta = with lib; {
    description = "Fast SYN/CONNECT port scanner";
    longDescription = ''
      Naabu is a port scanning tool written in Go that allows you to enumerate
      valid ports for hosts in a fast and reliable manner. It is a really simple
      tool that does fast SYN/CONNECT scans on the host/list of hosts and lists
      all ports that return a reply.
    '';
    homepage = "https://github.com/projectdiscovery/naabu";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
