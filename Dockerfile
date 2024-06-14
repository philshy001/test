# 第一阶段：获取 Composer
FROM composer:latest AS composer-setup

# 第二阶段：创建基于 PHP 7.4 的镜像并安装 Composer （如果需要其他php版本，到 Docker Hub中寻找对应版本的php镜像）
FROM php:7.4-cli

# 更新包列表并安装必要工具
RUN apt-get update && apt-get install -y \
    git \
    unzip

# 从第一阶段复制 Composer 到当前镜像的 /usr/bin/ 目录
COPY --from=composer-setup /usr/bin/composer /usr/bin/composer

# 设置工作目录
WORKDIR /app
