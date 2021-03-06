<h1 align="center">Zabbix Monitoring on Azure<br/>with Terraform and GitHub Actions</h1>
<p align="center">
  <a href="https://github.com/ShinhyeongPark/ZabbixMonitoring">
    <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
  </a> 
  <a href="https://github.com/ShinhyeongPark/Terraform-GitHubAction/blob/main/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-yellow.svg" />
  </a>
  <a href="https://github.com/ShinhyeongPark/Terraform-GitHubAction/actions/workflows/terraform.yml" target="_blank"><img src="https://github.com/ShinhyeongPark/Terraform-GitHubAction/actions/workflows/terraform.yml/badge.svg?branch=main">
  </a>
</p>

> Zabbix를 사용해 시스템 모니터링과 Grafana를 사용하여 데이터 시각화를 구현하였습니다.
> <br/>CSP로는 Azure를 이용했고, 프로젝트를 진행하기 전에 Terraform과 Azure를 충분히 학습했습니다. 
> <br/>또한 테라폼에서 지원하는 모듈들을 사용했으며, GitHub Actions로 CI/CD를 구성했습니다.

<br/>

### Zabbix&Grafana 모니터링 시스템 구축 메뉴얼은 아래 링크에 정리했습니다. <br/> 구축하기 전에 Zabbix와 Grafana가 무엇인지 학습하는 것을 권장합니다.
[Zabbix 정리](https://peppermint-waxflower-244.notion.site/Zabbix-099e013553b747e6b515d18f27d1a611)
<br/>
[Monitoring System on Azure 구축 메뉴얼](https://peppermint-waxflower-244.notion.site/Monitoring-System-on-Azure-bac5b5a247014cd4b5489a2b6630f736)
<br/>
[Zabbix&Grafana Montioring System 구축 메뉴얼](https://peppermint-waxflower-244.notion.site/Zabbix-Grafana-21d4521342db4f56a15f06552b227f40)
<br/>
[Azure Loadbalancer 공부](https://peppermint-waxflower-244.notion.site/Azure-Load-Balancer-ffb1c7b417b94348b68dbf089cb9d1f6)
<br/>

## 🙌 Abstract
- Project Name: Monitoring System on Azure
- Service: Zabbix + Grafana + Slack Integration
- Resource
    - Bastion(VM): Public Subnet
    - Zabbix(VM): Public Subnet
    - Grafana(VM): Private Subnet
    - Zabbix DB(Azure Database for MySQL Server): Private Subnet 

<br/>

## ❤️ Requirement
### 1. **리소스 스케쥴 생성(기동 및 백업)**

- Grafana AP 서버의 경우, 평일 기준 08:30 ~ 17:30 설정 후 이후 시간에는 OFF
- 전체 운영 서버에 관한 Backup 스케쥴 생성 (보관주기 7일, 백업시간 03:00)

### 2. **모니터링**

1.  VM 및 DB 리소스에 관한 Zabbix Integration 진행
2.  각 VM에 zabbix agent 설치 후 host 연동(Dashboard 및 Graph, Trigger 생성 및 연동 확인)  
3. Zabbix + Grafana Integration 진행 
4. Grafana 대시보드 설정 
5. Zabbix 내 Azure Cloud Monitoring 설정(Dashboard 및 Graph, Trigger 생성 및 연동 확인)
## ⚙ Azure Infrastructure
![스크린샷 2021-11-21 오후 2 54 56](https://user-images.githubusercontent.com/57867611/142751417-1811f9be-194f-453d-a78f-636730af728b.png)

### 리소스 생성 순서
    - Resource Group
    - VNET
    - NAT Gateway
    - Subnet (Public, Private, DB)
    - NSG
    - NIC (Bastion, Zabbix, Grafana)
    - Public IP (Bastion, Zabbix, Grafana)
    - DNS
    - VM (Bastion, Zabbix, Grafana)
    - Azure Database for MySQL
    - Load Balancer

<br/>

### 리소스 명명 규칙
<br/> 구분 및 식별을 위해서 명명 규칙을 정해 적용하였고, 추후 리소스 태그에 따른 기능 개발을 위해
<br/> 태그를 구체적으로 달았습니다.명명 규칙은 아래 사이트를 참조했습니다.
<br/> [리소스 명명 규칙 참고 사이트](https://docs.microsoft.com/ko-kr/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)

<br/>

### 리소스 현황
![스크린샷 2021-11-21 오후 2 45 20](https://user-images.githubusercontent.com/57867611/142751257-17b97f9d-a94c-4a04-9267-ccc3d59555fd.png)

<br/>

## 📌 Application Diagram
<img width="737" alt="스크린샷 2021-11-26 오후 3 51 01" src="https://user-images.githubusercontent.com/57867611/143539064-68d7f28a-fd2e-40f4-a4e7-a803b5887f76.png">

> Docker-Compose로 Zabbix Server, Web, Agent Container 관리<br/>
> Grafana도 Docker로 동작시켜 Zabbix와 연동 (Zabbix는 MySQL과 연동 필요) 

<br/>

## 🚀 Zabbix 모니터링과 Grafana Data 시각화 결과
### Zabbix
![Zabbix](https://user-images.githubusercontent.com/57867611/142751307-e0682f67-fcc5-4548-b845-1179ac95a740.png)

### Grafana
![Grafana](https://user-images.githubusercontent.com/57867611/142751315-804da0c4-78c1-4fd9-8dcb-9f5d6f9d2303.png)

<br/>

## 📖 Learn
###  이 프로젝트를 수행하기 위해서 아래 사이트를 참고하고 실습을 진행했습니다.
1. [Terraform을 사용한 AZURE 인프라 구축](https://learn.hashicorp.com/collections/terraform/azure-get-started)
2. [Terraform을 사용한 Docker 인프라 구축](https://learn.hashicorp.com/collections/terraform/docker-get-started)
3. [Terraform GitHub Actions 튜토리얼](https://learn.hashicorp.com/tutorials/terraform/github-actions)
4. [Terraform Documents](https://www.terraform.io/docs/index.html)
5. [Terraform Registry](https://registry.terraform.io/)
6. [Terraform Module Source Code](https://registry.terraform.io/namespaces/Azure)
7. [Terraform AWS 구축 프로젝트 - ShinhyeongPark](https://github.com/ShinhyeongPark/Terraform-GitHubAction)
8. [Docker Hub](https://hub.docker.com/)
9. [Zabbix Document](https://www.zabbix.com/documentation/current/manual)
<br/>

## ⭐️ Prerequisites
### 프로젝트를 수행하기 위해 아래의 항목들을 참고 또는 설치가 필요합니다.
1. Terraform CLI
2. [Azure Account](https://portal.azure.com/)
5. [Terraform Cloud Account](https://www.terraform.io/cloud)
6. Docker
7. Docker Compose
8. [GitHub Account](https://github.com/)

<br/>

## 💡 Reference
### Learn에서 수행한 실습과 Prerequisites를 준비하는 과정들을 노션에 정리했으니 참고해주세요.

- [Terraform으로 인프라 자동화](https://peppermint-waxflower-244.notion.site/Terraform-69f91597baa042f1a90a45e0b8dcf899)
- [Terraform GitHub Actions: CI/CD 구성](https://peppermint-waxflower-244.notion.site/Github-Actions-with-Terraform-730b8c97f9724fe498664070a7e675de)

<br/>



## 🦸‍♂️ Author

👤 **Shinhyeong Park**

* Github: https://github.com/ShinhyeongPark
* Velog: [@Shinhyeong Park](https://velog.io/@orpsh1941)
* Email: orpsh1941@gmail.com

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)
