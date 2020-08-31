#!/bin/bash
Bookinfo_Deployment="
  productpage-v1 \
  details-v1 \
  ratings-v1 \
  reviews-v1 \
  reviews-v2 \
  reviews-v3"

for Deployment_Name in $Bookinfo_Deployment;
do
  oc patch deployment/$Deployment_Name -p '{"spec":{"template":{"metadata":{"annotations":{"sidecar.istio.io/inject": "true"}}}}}' -n bookinfo
done
