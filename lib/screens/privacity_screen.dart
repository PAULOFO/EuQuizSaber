import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Política de Privacidade',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 94.0),
              child: Text(
               'Política de Privacidade',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '1. INFORMAÇÕES QUE COLETAMOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dados pessoais:',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'EuQuizSaber não recolhe ou utilza quaisquer dados pessoais que possam ser utilizados para identificar ou contatá-lo, sem o seu consentimento.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            //SizedBox(height: 20),
            Text(
              'EuQuizSaber não recolhe nem utiliza nomes, endereços de e-mail, fotografias, números de telefone, números de cartões de crédito, nomes de'
                  'contas, números de contas ou outras informações que permitam a EuQuizSaber identificá-lo. Se o aplicativo usar serviços de terceiros '
                  'para compartilhar conteúdo gerado usando esse aplicativo, o aplicativo acessaria seus dados básicos de tais serviços de terceiros necessários '
                  'para autenticação, compartilhamento de conteúdo ou outros recursos fornecidos pelos terceiros, no entanto, o aplicativo não recolherá ou utilizará'
                  'quaisquer dados pessoais.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dados não pessoais:',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'EuQuizSaber pode usar ferramentas ou software analítico de terceiros para coletar e usar determinados dados não pessoais que não permitem o EuQuizSaber'
                  ' identificá-lo. Os tipos de dados não pessoais que EuQuizSaber pode coletar e usar incluem, mas não estão limitados a:(i) tipo de dispositivo móvel;'
                  ' (ii)versão do software do dispositivo móvel; (iii) dados geográficos não mais precisos que as áreas metropolitanas; (iv) tempo total de uso de aplicativos'
                  ' e uso de filtros; (V) outros dados não-pessoais do aplicativo como razoavelmente exigido por EuQuizSaber para realçar suas características.',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '2. COMO NÓS USAMOS SUA INFORMAÇÕES',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Além de alguns dos usos específicos de informações que descrevemos nesta Política de Privacidade, nós podemos usar as informações que recebemos para:\n\n'
                  '- fornecer informações e conteúdo personalizados para você e outros, o que pode incluir anúncios online ou outras formas de marketing\n\n'
                  '- fornecer, aprimorar, testar e monitorar a eficiência de nosso serviço\n\n'
                  '- desenvolver e testar novos produtos e recursos\n\n'
                  '- monitorar métricas como o número total de visitantes, tráfego e padrões demográficos\n\n'
                  '- diagnosticar ou cprrigir problemas de tecnologia',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '3. COMPARTILHAMENTO DE SUAS INFORMAÇÕES',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nós não alugaremos nem venderemos suas informações a terceiros fora do EuQuizSaber sem a sua autorização, exceto conforme descrito nesta Política.',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Partes com as quais podemos compartilhar suas informações:',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '- Nós podemos compartilhar o Conteúdo do Usuário e sua informações (incluindo, entre outras, identificadores de dispositivo, dados de localização e dados de uso) com empresas'
                  'que façam parte legalmente do mesmo grupo de empresas do qual o EuQuizSaber é parte ou que se tornem parte deste grupo("Afiliadas"). As Afiliadas podem usar'
                  'essas informações para ajudar a fornecer, entender e aprimorar o Serviço (incluindo o fornecimento de análises) e os próprios serviços das Afiliadas (incluindo'
                  ' o fornecimento a você de experiências melhores e mais relevantes). Contudo, essas Afiliadas respeitarão as escolhas feitas por você sobre que pode ver suas fotos.\n\n'
                  '- Nós também podemos compartilhar suas informações, assim como informações de ferramentas de identificadores de dispositivo e dados de localização , com organizações de '
                  'terceiros  que ajudam a fornecer o Serviço a você ("Provedores de Serviço"). Nossos Provedores de Serviço receberão acesso às suas informações conforme razoavelmente'
                  ' necessário para fornecer o Serviço mediante termos de confidencialidade aceitáveis.\n\n'
                  '- Nós podemos remover partes de dados que possam identificá-lo e compartilhar dados anônimos com outras partes. Nós tabém podemos combinar suas informações com outras '
                  'informações para que elas não fiquem mais associadas a você e compartilhar essas informações agregadas.',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Partes com quem você pode escolhar compartilhar seu Conteúdo de Usuário:',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '- Qualquer informação ou conteúdo que você divulga voluntariamente para publicação no Serviço, como Conteúdo do Usuário, é disponibilizado para o público'
                  ' conforme controlado pelas configurações de privacidade definidas por você. Para alterar suas configurações de privacidade no Serviço, altere suas configurações de perfil.'
                  'Após você ter compartilhado ou disponibilizado seu Conteúdo do Usuário para o público, este Conteúdo do Usuário pode ser compartilhado novamente por outros.\n\n'
                  '- Obedecendo suas configurações de perfil e privacidade, qualquer Conteúdo do Usuário que você disponibiliza para o público pode ser pesquisado por outros Usuários.\n\n'
                  '- Se você remover informações que você publicou no Serviço, cópias podem permanecer visualizáveis em páginas armazenadas em cache e arquivadas do Serviço, ou se outros Usuários'
                  ' ou Terceiros que estiverem usando o EuQuizSaber tiverem copiado ou salvo essas informações.',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'O que acontece no caso de uma alteração de controle:',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Se nós vendermos ou transferirmos parte ou todo o EuQuizSaber ou nossos ativos para outra organização (por exemplo, durante uma transação de fusão, aquisição, falência, dissolução,'
                  'liquidação),  qualquer informação coletada através do Serviço pode estar entre os itens vendidos ou transferidos. Você continuará a ser o próprietário do seu Conteúdo de Usuário.'
                  ' O comprador ou cessionário terá que respeitar os compromissos que fizemos nesta Política de Privacidade.',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Atendendo a solicitações judiciais e evitando prejuízos:',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nós podemos acessar, reter e compartilhar suas informações em resposta a uma solicitação judicial (como um mandado de busca, ordem judicial ou intimação) se acreditarmos em boa fé'
                  ' que a lei nos obriga a fazer isso. Isso pode incluir a resposta a solicitações judiciais de jurisdições fora do Brasil quando acreditarmos de boa fé que a resposta a solicitações'
                  ' judiciais de jurisdições fora do Brasil quando acreditarmos de boa fé que a resposta é exigida poe lei na jurisdição em questão e está em conformidade coom padrões reconhecidos'
                  ' internacionalmente. Também podemos acessar, reter e compartilhar informações quando acreditarmos em boa fé que isso seja necessário para: detectar, impedir e resolver fraudes'
                  ' ou outras atividades ilegais; proteger a nós mesmos, nossos Serviços, você e outras pessoas, inclusive como parte das investigações; impedir a morte ou lesões corporais iminentes.'
                  ' As informações que recebemos sobre você podem ser acessadas, processadas e retidas por um período prolongado quando estiverem relacionadas a uma solicitação ou obrigação jurídica,'
                  ' investigação governamental ou investigações relacionadas a possíves violações de nossos termos ou políticas, ou, então , para impedir prejuízos.',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '4. OUTROS SITES E SERVIÇOS',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nós não somos responsáveis pelas práticas empregadas por nenhum site ou serviço vinculado através de link ao Serviço, ou a partir dele, incluindo as informações oui conteúdo '
                  'contidos nele. Lembre-se que, quando você usa um link para ir de nosso Serviço para outro site ou serviço, nossa Política de Privacidade não se aplica a esses sites ou serviços'
                  ' de terceiros. Sua navegação e interação com qualquer site ou serviço de terceiros, incluindo aqueles que possuem um link em nosso aplicativo, estão sujeitas às próprias'
                  ' regras e políticas desses terceiros. Além disso, você concorda que nós não somos responsáveis e não temos controle sobre qualquer terceiro que você autorize a acessar'
                  ' o seu Conteúdo de Usuário. Se você estiver usando um aplicativo ou serviço e permitir que eles acessem seu Contepudo de Usuário, você faz isso por conta e risco.',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '5. COMO ENTRAR EM CONTATO CONOSCO',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Se tiver quaisquer dúvidas sobre esta Política de Privacidade ou sobre o Serviço, entre em contato conosco através do email:\n'
                  'paulofo.forever@gmail.com',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ALTERAÇÕES EM NOSSA POLÍTICA DE PRIVACIDADE',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'O EuQuizSaber pode modificar ou atualizar esta Política de Privacidade de tempos em tempos, portanto verifique-a periodicamente. Nós podemos'
                  ' fornecer a você formas adicionais de aviso sobre sobre modificações ou atualizações conforme apropriado mediante as circunstâncias. A continuação do seu'
                  ' uso do EuQuizSaber ou do Serviço após qualquer modificação desta Política de Privacidade constituirá sua aceitação das modificações em questão.\n\n'
                  'A data de efetivação desta Política de Privacidade é \n07 de Maio de 2020.',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Container(
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
