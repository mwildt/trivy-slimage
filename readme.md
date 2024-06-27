# SLES-based *slimage* for Trivy Vuln-Scanner

Das Image enthält einfach den Trivy Schwachstellen-Scanner und basiert auf dem SUSE-SLES basis-image.

> **ACHTUNG:** Der für die prüdung der Signature des trivy binaries verwendete GPG public-key wurde am Tag des Commits von github herunter geladen.

## Useful Commands

Build the Image RPM-style
```bash
 podman build -f trivy-rpm.dockerfile --tag sles/trivy .
```

Export Image as Tar-file
```bash
podman save --output ./target/sles-trivy.tar --format oci-dir localhost/sles/trivy:latest
```

Danach kann das zur gespeicherter image mit dem trinvy-in-container-image gescannt werden 
```bash
podman run --rm -v ./target:/data localhost/sles/trivy:latest --input /data/sles-trivy.tar image 
```

```bash
podman run --rm -v ./target:/data \
 localhost/sles/trivy:latest \
 --input /data/sles-trivy.tar image --format cyclonedx --output /target/sles-trivy.sbom.json 
```
