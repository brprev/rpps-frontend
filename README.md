# Aplicativo Flutter para Web

Este é um guia passo a passo para executar o meu aplicativo Flutter na web e configurá-lo em um serviço de hospedagem.

## Pré-requisitos

- Flutter SDK instalado. Você pode encontrá-lo em [flutter.dev](https://flutter.dev).
- Um editor de texto ou uma IDE para modificar o código, como o Visual Studio Code ou o Android Studio.
- Conhecimento básico do Flutter e de programação em Dart.

## Executando o aplicativo localmente

1. Clone o repositório do aplicativo para o seu ambiente local.
   ```
   git clone <URL DO REPOSITÓRIO>
   ```

2. Navegue até o diretório do aplicativo.
   ```
   cd nome_do_aplicativo/
   ```

3. Verifique se o Flutter está configurado corretamente executando o seguinte comando:
   ```
   flutter doctor
   ```

4. Execute o aplicativo no modo de desenvolvimento com o seguinte comando:
   ```
   flutter run -d chrome
   ```

   Isso irá iniciar o aplicativo Flutter na web usando o navegador Chrome.

## Configurando o serviço de hospedagem

Agora que você conseguiu executar o aplicativo localmente, é hora de configurar o serviço de hospedagem para disponibilizá-lo na web.

1. Construa o aplicativo para a web usando o seguinte comando:
   ```
   flutter build web
   ```

   Isso irá gerar os arquivos estáticos do aplicativo na pasta `build/web`.

2. Escolha um serviço de hospedagem que suporte hospedagem estática, como o GitHub Pages, Netlify ou Firebase Hosting.

3. Siga as instruções fornecidas pelo serviço de hospedagem escolhido para fazer o upload dos arquivos estáticos do aplicativo para o servidor.

4. Após o upload, seu aplicativo estará disponível na web através do URL fornecido pelo serviço de hospedagem.

## Personalizando o domínio

Se você deseja personalizar o domínio do seu aplicativo Flutter na web, siga estas etapas adicionais:

1. Adquira um domínio personalizado de um registrador de domínios.

2. Configure as DNS do seu domínio para apontar para o servidor de hospedagem onde você fez o upload do aplicativo.

3. Siga as instruções do serviço de hospedagem para adicionar o domínio personalizado ao seu aplicativo.

4. Aguarde a propagação das DNS, o que pode levar algumas horas.

5. Depois que as DNS tiverem sido propagadas, seu aplicativo Flutter estará acessível usando o domínio personalizado.
