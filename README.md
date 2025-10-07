# Prueba Técnica GCP — Despliegue de Aplicación Web por Julian Morante Rios

Este proyecto implementa una infraestructura básica en **Google Cloud Platform (GCP)** para desplegar una aplicación web sencilla utilizando **Terraform modularizado** como herramienta de **Infraestructura como Código (IaC)**.

---

## Objetivo

Desplegar una instancia de **Compute Engine** con **Nginx** en una **VPC dedicada**, utilizando **Terraform modular** y **comandos gcloud**, demostrando conocimientos de arquitectura en la nube y automatización con IaC.

---

## Arquitectura Implementada

### Componentes Principales

| Recurso | Servicio GCP | Descripción |
|----------|---------------|-------------|
| VPC | `google_compute_network` | Red virtual aislada para la aplicación |
| Subred | `google_compute_subnetwork` | Subred personalizada dentro de la VPC |
| Firewall | `google_compute_firewall` | Permite tráfico HTTP/HTTPS desde Internet |
| Compute Engine | `google_compute_instance` | Instancia Ubuntu con Nginx instalado automáticamente |

---

Escenario 1: Preguntas de Selección Múltiple
1. ¿Cuál es la herramienta de GCP recomendada para IaC?
Respuesta: C. Terraform
Justificación:
Terraform es la herramienta más utilizada para la gestión de infraestructura como código en GCPl, terrafon al ser multi cloud permite adaptarce de la mejor manera a cualquier tipo de nube, siendo azure, aws o google, ademas cuento con una experiencia solida en esta herramienta de mas de 2 años.

2. Si necesitas crear un clúster de Kubernetes en GCP, ¿qué servicio utilizarías?
Respuesta: D. GKE (Google Kubernetes Engine)
Justificación:
GKE es el servicio administrado de Kubernetes en Google Cloud. Facilita la creación, gestión y escalado de clústeres sin necesidad de administrar manualmente los nodos maestros ni la configuración de red.

3. ¿Cuál es la función principal de Cloud Armor?
Respuesta: C. Proteger las aplicaciones de ataques DDoS y WAF (Web Application Firewall)
Justificación:
Cloud Armor es el servicio de seguridad perimetral de GCP que mitiga ataques DDoS y permite definir políticas WAF personalizadas para proteger aplicaciones expuestas en internet.

4. En GCP, ¿qué servicio se utiliza para ejecutar código sin servidor en respuesta a eventos?
Respuesta: D. (Cloud Functions)
Justificación:
Cloud Functions permite ejecutar funciones ligeras basadas en eventos sin necesidad de gestionar servidores, ideal para integraciones, triggers de Pub/Sub o Cloud Storage.

5. ¿Qué servicio de GCP debes usar para un despliegue de contenedores completamente gestionado y sin servidor que escala automáticamente?
Respuesta: C. (Cloud Run)
Justificación:
Cloud Run permite ejecutar contenedores en una infraestructura totalmente gestionada, con escalado automático y sin preocuparse por la administración del clúster subyacente.

6. Para almacenar archivos estáticos y objetos de manera segura y escalable, ¿qué servicio de GCP es el más adecuado?
Respuesta: a. Cloud Storage
Justificación:
Cloud Storage es el servicio de almacenamiento de objetos de Google Cloud, diseñado para archivos estáticos, backups, contenido web o multimedia, con durabilidad y seguridad integradas.

---
Escenario 2: Ejercicio Práctico - Despliegue de una Aplicación Web Sencilla

Es importante ejecutar los documentos de IAC. terraform para construir el recurso y de manera local se debe cde crear una llabe Privada y publica para conectarce con el servidor de manera segura. 

## Conexión SSH a la Instancia
Una vez creada la infraestructura, se puede acceder a la VM con el siguiente comando:

```bash
gcloud compute ssh <nombre_instancia> --zone=<zona>
```
**Ejemplo:**
```bash
gcloud compute ssh test-instance --zone=us-central1-a
```

## Despliegue de Nginx
1. Conéctese por SSH a la instancia:
   ```bash
   gcloud compute ssh test-instance --zone=us-central1-a
   ```
2. Instale Nginx:
   ```bash
   sudo apt update && sudo apt install -y nginx
   ```
3. Cree el archivo `/var/www/html/index.html`:
   ```bash
   echo "¡Bienvenido a la prueba técnica de Domina Digital!" | sudo tee /var/www/html/index.html
   ```
4. Verifique el servicio:
   ```bash
   systemctl status nginx
   ```
5. Acceda a la IP pública mostrada por Terraform:
   ```
   http://<ip_publica>
   ```

## Entregables : 
    1. URL IP : http://34.121.61.59/
---

## Evidencias 

![Construccion efectiva de IAC ](https://res.cloudinary.com/dnrj7cbj6/image/upload/v1759841884/Captura_de_pantalla_2025-10-07_a_la_s_7.57.06_a.m._ayq3ry.png)


![ejecucion de terraform IAC ](https://res.cloudinary.com/dnrj7cbj6/image/upload/v1759842085/Captura_de_pantalla_2025-10-07_a_la_s_8.01.19_a.m._swve9t.png)

![Conexion SSH y Implementacion de Ngix ](https://res.cloudinary.com/dnrj7cbj6/image/upload/v1759841884/Captura_de_pantalla_2025-10-07_a_la_s_7.22.06_a.m._vbaobk.png)