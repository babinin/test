# test

У репозиторії: 
тека docker містить докерфайли та файли необхідні для будови контейнерів,
тека microk8s містить маніфести для розгортання у кластері а також скрипт для автоматизації.

Для тестів використовувася Microk8s (https://microk8s.io/).

Для моніторингу викоритовується kubernetes-dashboard (microk8s.enable dashboard або 
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml)
Для зручності доступу до тестової сторінки можна використати kubectl port-forward deployment/frontend --namespace=test 80:80, або додати у front.yaml директиву hostNetwork: true та dnsPolicy: ClusterFirstWithHostNet, після чого под отримає адресу локального хосту.
