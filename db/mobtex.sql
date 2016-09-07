-- phpMyAdmin SQL Dump
-- version 3.0.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Set 07, 2016 as 08:01 PM
-- Versão do Servidor: 5.0.51
-- Versão do PHP: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `novomobtex`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(10) NOT NULL default 'banner',
  `name` varchar(50) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_banner`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `contact` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_bannerclient`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_bannerfinish`
--

CREATE TABLE IF NOT EXISTS `jos_bannerfinish` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(10) NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `impressions` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(50) NOT NULL default '',
  `datestart` datetime default NULL,
  `dateend` datetime default NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_bannerfinish`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(50) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `image` varchar(100) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(10) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_section` (`section`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(1, 0, 'MOBTEX', 'MOBTEX', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Extraindo dados da tabela `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, ''),
(2, 'Administar Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, ''),
(3, 'Administar Clientes', '', 0, 1, 'option=com_banners&task=listclients', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, ''),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/globe2.png', 0, ''),
(5, 'Weblink Itens', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, ''),
(6, 'Weblink Categorias', '', 0, 4, 'option=categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, ''),
(7, 'Contatos', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/user.png', 1, ''),
(8, 'Administrar Contatos', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, ''),
(9, 'Categoria Contatos', '', 0, 7, 'option=categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, ''),
(10, 'Primeira Página', 'option=com_frontpage', 0, 0, '', 'Gerir Artigos da Primeira Página', 'com_frontpage', 0, 'js/ThemeOffice/component.png', 1, ''),
(11, 'Enquetes', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, ''),
(12, 'Notícias Externas', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, ''),
(13, 'Administrar Notícias Externas', '', 0, 12, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, ''),
(14, 'Administrar Categorias', '', 0, 12, 'option=categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, ''),
(15, 'Login', 'option=com_login', 0, 0, '', '', 'com_login', 0, '', 1, ''),
(16, 'Pesquisar', 'option=com_search', 0, 0, '', '', 'com_search', 0, '', 1, ''),
(17, 'Difusão de Notícias', '', 0, 0, 'option=com_syndicate&hidemainmenu=1', 'Gerir configuração de Difusão dos Sinais Noticiosos', 'com_syndicate', 0, 'js/ThemeOffice/component.png', 0, ''),
(18, 'E-mail em Massa', '', 0, 0, 'option=com_massmail&hidemainmenu=1', 'Enviar e-mail para múltiplos destinatários', 'com_massmail', 0, 'js/ThemeOffice/mass_email.png', 0, ''),
(19, 'JCE Admin', 'option=com_jce', 0, 0, 'option=com_jce', 'JCE Admin', 'com_jce', 0, 'js/ThemeOffice/component.png', 0, ''),
(20, 'JCE Configuration', '', 0, 19, 'option=com_jce&task=config', 'JCE Configuration', 'com_jce', 0, 'js/ThemeOffice/controlpanel.png', 0, ''),
(21, 'JCE Languages', '', 0, 19, 'option=com_jce&task=lang', 'JCE Languages', 'com_jce', 1, 'js/ThemeOffice/language.png', 0, ''),
(22, 'JCE Plugins', '', 0, 19, 'option=com_jce&task=showplugins', 'JCE Plugins', 'com_jce', 2, 'js/ThemeOffice/add_section.png', 0, ''),
(23, 'JCE Layout', '', 0, 19, 'option=com_jce&task=editlayout', 'JCE Layout', 'com_jce', 3, 'js/ThemeOffice/content.png', 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `con_position` varchar(50) default NULL,
  `address` text,
  `suburb` varchar(50) default NULL,
  `state` varchar(20) default NULL,
  `country` varchar(50) default NULL,
  `postcode` varchar(10) default NULL,
  `telephone` varchar(25) default NULL,
  `fax` varchar(25) default NULL,
  `misc` mediumtext,
  `image` varchar(100) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(100) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`) VALUES
(1, 'MOBTEX', '', 'Dona Francisca, 9215', 'Joinville', 'Santa Catarina', 'Brasil', '89239-270', '(55) 47 3435-2803', '', '<a target="_blank" href="http://maps.google.com/maps/ms?f=q&hl=pt-BR&geocode=&ie=UTF8&msa=0&msid=105096894371920752611.000459c1def0e38dc6252&ll=-26.238652,-48.889225&spn=0.008507,0.013819&z=16"><img src="http://localhost/NovoMobtex/images/stories/googlemaps.jpg" align="left" hspace="6" alt="googlemaps" border="0" /></a>', '', NULL, 'vendas@mobtex.com.br', 0, 1, 0, '0000-00-00 00:00:00', 1, 'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=1\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=', 62, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `title_alias` varchar(100) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(100) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_mask` (`mask`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`) VALUES
(1, 'Home', 'Home', '<table style="width: 100%" width="100%" border="0" cellpadding="5" cellspacing="5">\r\n	<tbody>\r\n		<tr>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28; width: 208px" border="1" cellpadding="3" cellspacing="0">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28">\r\n						<img src="images/stories/imghome.jpg" alt="imghome.jpg" title="imghome.jpg" style="margin: 5px; float: left; width: 208px; height: 282px" width="208" height="282" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')">\r\n						Cada movimento move uma paix&atilde;o. Crie e abuse dos tecidos da linha esportiva. <a href="index.php?option=com_content&amp;task=view&amp;id=4&amp;Itemid=10" target="_self"><span style="color: #ffff3b">SAIBA MAIS</span></a> \r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td>\r\n			<table width="330">\r\n				<tbody>\r\n					<tr>\r\n						<td>\r\n						&nbsp;Integradora<br />\r\n						<br />\r\n						- Para a Diklatex significa integrar-se com seus clientes na busca pela sinergia.<br />\r\n						- &Eacute; adaptar-se &agrave;s novas exig&ecirc;ncias dos clientes.<br />\r\n						- Significa aceitar o papel de juntar-se aos clientes para o desenvolvimento de novas tecnologias.<br />\r\n						<br />\r\n						<br />\r\n						Pr&oacute;xima<br />\r\n						<br />\r\n						- Significa buscar uma proximidade com o homem a partir das tend&ecirc;ncias da moda.<br />\r\n						- &Eacute; estar equilibrada com o meio ambiente.<br />\r\n						- &Eacute; a disponibilidade para realizar neg&oacute;cios exclusivos com seus clientes.<br />\r\n						<br />\r\n						<br />\r\n						Corajosa<br />\r\n						<br />\r\n						- Quando decide pelo investimento em pesquisa e desenvolvimento.<br />\r\n						- Significa a coragem de decidir pelo crescimento.<br />\r\n						- Coragem de estar em um segmento t&atilde;o din&acirc;mico.<br />\r\n						- Quando conquista grandes marcas como clientes.<br />\r\n						<br />\r\n						<br />\r\n						Realizadora<br />\r\n						<br />\r\n						- Quando p&otilde;e em pr&aacute;tica os projetos de desenvolvimento de novas tecnologias.<br />\r\n						- Na hora em que realiza a integra&ccedil;&atilde;o entre a roupa e o homem.<br />\r\n						- Significa criar, fazer e concretizar de acordo com as necessidades dos clientes.<br />\r\n						&nbsp;\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', 1, 0, 0, 0, '2008-10-13 21:00:36', 62, '', '2008-10-21 11:06:58', 62, 0, '0000-00-00 00:00:00', '2008-10-13 21:00:25', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=', 1, 0, 0, '', '', 0, 134),
(2, 'Empresa', 'Empresa', '<table style="width: 100%" width="100%" border="0" cellpadding="5" cellspacing="5">\r\n	<tbody>\r\n		<tr>\r\n			<td valign="top">\r\n			<table style="width: 208px" border="0" cellpadding="3" cellspacing="0">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28">\r\n						<img src="images/stories/foto_empresa.jpg" alt="foto_empresa.jpg" title="foto_empresa.jpg" style="margin: 5px; float: left; width: 204px; height: 267px" width="204" height="267" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: medium none ; height: 5px; font-size: 5px">\r\n						&nbsp;\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px" valign="middle" align="center">CONHE&Ccedil;A AS LINHAS\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<a href="index.php?option=com_content&amp;task=view&amp;id=5&amp;Itemid=11" target="_self"><img src="images/stories/fitness.png" style="border: 0px none #000000; width: 136px; height: 45px" alt="fitness.png" title="fitness.png" width="136" height="45" /></a> </td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<a href="index.php?option=com_content&amp;task=view&amp;id=7&amp;Itemid=13" target="_self"><img src="images/stories/diverse.png" style="border: 0px none #000000; width: 136px; height: 45px" alt="diverse.png" title="diverse.png" width="136" height="45" /></a> </td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<a href="index.php?option=com_content&amp;task=view&amp;id=6&amp;Itemid=12" target="_self"><img src="images/stories/shoes.png" style="border: 0px none #000000; width: 136px; height: 45px" alt="shoes.png" title="shoes.png" width="136" height="45" /></a> </td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28" width="330">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; background-color: #171411; height: 50px" valign="top">\r\n						<hr size="1" width="100%" color="#ffbc2d" />\r\n						A MOBTEX</td>\r\n					</tr>\r\n					<tr>\r\n						<td valign="top">\r\n						<p>\r\n						<br />\r\n						<br />\r\n						A empresa MOBTEX oferece o servi&ccedil;o adequado &agrave;s necessidades dos clientes. Sempre inovando e trazendo para o mercado novas linhas.<br />\r\n						Queremos evocar a cria&ccedil;&atilde;o de novos produtos, assim, conscientes da import&acirc;ncia da inova&ccedil;&atilde;o, fazemos com que nossos tecidos possam ser usados nas mais diversas &aacute;reas de atua&ccedil;&atilde;o. Atendendo de pequenas a grandes empresas.<br />\r\n						<br />\r\n						<img src="images/stories/liberdade.jpg" alt="liberdade.jpg" title="liberdade.jpg" style="margin: 5px; float: left; width: 152px; height: 60px" width="152" height="60" /><br />\r\n						</p>\r\n						<p>\r\n						&nbsp;\r\n						</p>\r\n						<p>\r\n						&nbsp;\r\n						</p>\r\n						<p>\r\n						Apresentamos por isso a &quot;LIBERDADE PARA CRIAR&quot;: A frente do seu tempo, o trabalho em conjunto &eacute; fundamental para a evolu&ccedil;&atilde;o da moda e de novas tend&ecirc;ncias. Sempre alinhando nossos profissionais com a criatividade da sua empresa.<br />\r\n						<br />\r\n						A Mobtex possui tr&ecirc;s linhas de tecidos para atend&ecirc;-lo em todas as formas<br />\r\n						<br />\r\n						<a href="index.php?option=com_content&amp;task=view&amp;id=5&amp;Itemid=11" target="_self"><b><span style="color: #ff6e14">FITNESS</span></b></a>  - Materiais mais flex&iacute;veis. Na linha Fitness os tecidos s&atilde;o elaborados especialmente para atender a &aacute;rea esportiva.<br />\r\n						<br />\r\n						<a href="index.php?option=com_content&amp;task=view&amp;id=7&amp;Itemid=13" target="_self"><b><span style="color: #d83a76">DIVERSE</span></b></a>  - Tecidos especiais para adaptar a sua empresa independente do ramo de atividade.<br />\r\n						<br />\r\n						<a href="index.php?option=com_content&amp;task=view&amp;id=6&amp;Itemid=12" target="_self"><b><span style="color: #1cc3c4">SHOES</span></b></a>  - Materiais mais resistentes para ind&uacute;stria de cal&ccedil;ados.<br />\r\n						<br />\r\n						&nbsp;\r\n						</p>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', 1, 0, 0, 0, '2008-10-13 21:01:02', 62, '', '2008-10-21 11:11:40', 62, 0, '0000-00-00 00:00:00', '2008-10-13 21:00:39', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=', 1, 0, 0, '', '', 0, 77),
(3, 'Nossa Marca', 'Nossa Marca', '<table style="width: 100%" width="100%" border="0" cellpadding="5" cellspacing="5">\r\n	<tbody>\r\n		<tr>\r\n			<td valign="top">\r\n			<table style="width: 208px" border="0" cellpadding="3" cellspacing="0">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28">\r\n						<img src="images/stories/foto_empresa.jpg" alt="foto_empresa.jpg" title="foto_empresa.jpg" style="margin: 5px; float: left; width: 204px; height: 267px" width="204" height="267" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: medium none ; height: 5px; font-size: 5px">\r\n						&nbsp;\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px" valign="middle" align="center">CONHE&Ccedil;A AS LINHAS\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/fitness.png" alt="fitness.png" title="fitness.png" width="136" height="45" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/diverse.png" alt="diverse.png" title="diverse.png" width="136" height="45" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/shoes.png" alt="shoes.png" title="shoes.png" width="136" height="45" /></td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28" width="330">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; background-color: #171411; height: 50px" valign="top">\r\n						<hr size="1" width="100%" color="#ffbc2d" />\r\n						NOSSA MARCA<br />\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td valign="top">\r\n						<p>\r\n						<br />\r\n						<br />\r\n						A empresa MOBTEX oferece o servi&ccedil;o adequado &agrave;s necessidades dos clientes. Sempre inovando e trazendo para o mercado novas linhas.<br />\r\n						Queremos evocar a cria&ccedil;&atilde;o de novos produtos, assim, conscientes da import&acirc;ncia da inova&ccedil;&atilde;o, fazemos com que nossos tecidos possam ser usados nas mais diversas &aacute;reas de atua&ccedil;&atilde;o. Atendendo de pequenas a grandes empresas.<br />\r\n						<br />\r\n						<img src="images/stories/liberdade.jpg" alt="liberdade.jpg" title="liberdade.jpg" style="margin: 5px; float: left; width: 152px; height: 60px" width="152" height="60" /><br />\r\n						</p>\r\n						<p>\r\n						&nbsp;\r\n						</p>\r\n						<p>\r\n						&nbsp;\r\n						</p>\r\n						<p>\r\n						Apresentamos por isso a &quot;LIBERDADE PARA CRIAR&quot;: A frente do seu tempo, o trabalho em conjunto &eacute; fundamental para a evolu&ccedil;&atilde;o da moda e de novas tend&ecirc;ncias. Sempre alinhando nossos profissionais com a criatividade da sua empresa.<br />\r\n						<br />\r\n						A Mobtex possui tr&ecirc;s linhas de tecidos para atend&ecirc;-lo em todas as formas<br />\r\n						<br />\r\n						<b><span style="color: #ff6e14">FITNESS</span></b> - Materiais mais flex&iacute;veis. Na linha Fitness os tecidos s&atilde;o elaborados especialmente para atender a &aacute;rea esportiva.<br />\r\n						<br />\r\n						<b><span style="color: #d83a76">DIVERSE</span></b> - Tecidos especiais para adaptar a sua empresa independente do ramo de atividade.<br />\r\n						<br />\r\n						<b><span style="color: #1cc3c4">SHOES</span></b> - Materiais mais resistentes para ind&uacute;stria de cal&ccedil;ados.<br />\r\n						<br />\r\n						&nbsp;\r\n						</p>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', 1, 0, 0, 0, '2008-10-13 21:01:17', 62, '', '2008-10-21 10:52:45', 62, 0, '0000-00-00 00:00:00', '2008-10-13 21:01:05', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=', 1, 0, 0, '', '', 0, 34),
(4, 'Tecidos', 'Tecidos', '<table style="width: 100%" width="100%" border="0" cellpadding="5" cellspacing="5">\r\n	<tbody>\r\n		<tr>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28; width: 208px" border="0" cellpadding="3" cellspacing="0" height="430">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28" height="298"><img src="images/stories/img_fitness.jpg" alt="imghome.jpg" title="imghome.jpg" style="margin: 5px; float: left; width: 208px; height: 282px" width="208" height="282" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/fitness.png" alt="fitness.png" title="fitness.png" width="136" height="45" />\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')"> Tecnologia e conforto, a linha de Tecidos Fitness alia tend&ecirc;ncias da moda &agrave; tecnologia. <span style="color: #ff6e14"><br />\r\n						SAIBA MAIS</span> </td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28; width: 208px" border="1" cellpadding="3" cellspacing="0" height="430">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28" height="298"><img src="images/stories/img_shoes.jpg" alt="imghome.jpg" title="imghome.jpg" style="margin: 5px; float: left; width: 208px; height: 282px" width="208" height="282" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/shoes.png" alt="shoes.png" title="shoes.png" />						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')">Tecnologia e conforto, a linha de Tecidos Fitness alia tend&ecirc;ncias da moda &agrave; tecnologia. <span style="color: #1cc3c4"><br />\r\n						SAIBA MAIS</span> </td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28; width: 208px" border="1" cellpadding="3" cellspacing="0" height="430">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28" height="298"><img src="images/stories/img_diverse.jpg" alt="imghome.jpg" title="imghome.jpg" style="margin: 5px; float: left; width: 208px; height: 282px" width="208" height="282" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/diverse.png" alt="diverse.png" title="diverse.png" />\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')">Tecnologia e conforto, a linha de Tecidos Fitness alia tend&ecirc;ncias da moda &agrave; tecnologia. <span style="color: #d83a76"><br />\r\n						SAIBA MAIS</span> </td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28; width: 208px" border="1" cellpadding="3" cellspacing="0" height="430">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28" valign="top" height="298">\r\n						<img src="images/stories/foto_empresa.jpg" alt="foto_empresa.jpg" title="foto_empresa.jpg" style="margin: 5px; float: left; width: 204px; height: 267px" width="204" height="267" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px">A empresa MOBTEX oferece o servi&ccedil;o adequado as necessidades dos clientes. Sempre inovando e trazendo para o mercado novas linhas. Venha e conhe&ccedil;a a &quot;liberdade para criar&quot;.<br />\r\n						<span style="color: #ffff3b">SAIBA MAIS</span> </td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', 1, 0, 0, 0, '2008-10-13 21:01:42', 62, '', '2008-10-21 06:52:32', 62, 0, '0000-00-00 00:00:00', '2008-10-13 21:01:27', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=', 1, 0, 0, '', '', 0, 46),
(5, 'Fitness', 'Fitness', '<table style="width: 100%" width="100%" border="0" cellpadding="5" cellspacing="5">\r\n	<tbody>\r\n		<tr>\r\n			<td valign="top">\r\n			<table style="width: 208px" border="0" cellpadding="3" cellspacing="0">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28">\r\n						<img src="images/stories/foto_fitnes.jpg" alt="foto_empresa.jpg" title="foto_empresa.jpg" style="margin: 5px; float: left; width: 204px; height: 267px" width="204" height="267" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: medium none ; height: 5px; font-size: 5px">&nbsp;\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px" valign="middle" align="center">CONHE&Ccedil;A OUTRAS LINHAS\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/diverse.png" alt="diverse.png" title="diverse.png" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/shoes.png" alt="shoes.png" title="shoes.png" /></td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28" width="420">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; background-color: #171411; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="top" height="100">\r\n						<hr size="1" width="100%" color="#ffbc2d" />\r\n						<img src="images/stories/fitness.png" style="margin-left: 20px" alt="fitness.png" title="fitness.png" /><img src="images/stories/bandeira_amarela.png" alt="bandeira_amarela.png" title="bandeira_amarela.png" style="margin: 5px; float: right" />\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td valign="top">\r\n						<p>\r\n						<br />\r\n						<br />\r\n						Tecnologia e conforto, a Linha de Tecidos Fitness da Mobtex alia tend&ecirc;ncias da moda &agrave; tecnologia. Voce encontrat&aacute; tecidos para toda as modalidades esportivas que necessitam resist&ecirc;ncia, qualidade e flexibilidade. Nossa inten&ccedil;&atilde;o &eacute; aumentar ainda mais as possibilidades para cria&ccedil;&atilde;o.<br />\r\n						<br />\r\n						</p>\r\n						<p>\r\n						<img src="images/stories/tecidos.jpg" alt="tecidos.jpg" title="tecidos.jpg" style="margin: 5px; float: left; width: 417px; height: 170px" width="417" height="170" />&nbsp;&nbsp;						\r\n						</p>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', 1, 0, 0, 0, '2008-10-13 21:02:19', 62, '', '2008-10-21 11:01:14', 62, 0, '0000-00-00 00:00:00', '2008-10-13 21:02:02', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=', 1, 0, 0, '', '', 0, 31),
(6, 'Shoes', 'Shoes', '<table style="width: 100%" width="100%" border="0" cellpadding="5" cellspacing="5">\r\n	<tbody>\r\n		<tr>\r\n			<td valign="top">\r\n			<table style="width: 208px" border="0" cellpadding="3" cellspacing="0">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28">\r\n						<img src="images/stories/foto_shoes.jpg" alt="foto_shoes.jpg" title="foto_shoes.jpg" style="margin: 5px; float: left; width: 204px; height: 267px" width="204" height="267" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: medium none ; height: 5px; font-size: 5px">&nbsp;\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px" valign="middle" align="center">CONHE&Ccedil;A OUTRAS LINHAS\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/fitness.png" style="width: 136px; height: 45px" alt="fitness.png" title="fitness.png" width="136" height="45" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/diverse.png" style="width: 152px; height: 50px" alt="diverse.png" title="diverse.png" width="152" height="50" /></td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28" width="420">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; background-color: #171411; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="top" height="100">\r\n						<hr size="1" width="100%" color="#ffbc2d" />\r\n						<img src="images/stories/shoes.png" style="margin: 5px 20px" alt="fitness.png" title="fitness.png" /><img src="images/stories/bandeira_azul.png" alt="bandeira_azul.png" title="bandeira_azul.png" style="margin: 5px; float: right; width: 91px; height: 38px" width="91" height="38" />\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td valign="top">\r\n						<p>\r\n						<br />\r\n						<br />\r\n						Tecnologia e conforto, a Linha de Tecidos Fitness da Mobtex alia tend&ecirc;ncias da moda &agrave; tecnologia. Voce encontrat&aacute; tecidos para toda as modalidades esportivas que necessitam resist&ecirc;ncia, qualidade e flexibilidade. Nossa inten&ccedil;&atilde;o &eacute; aumentar ainda mais as possibilidades para cria&ccedil;&atilde;o.<br />\r\n						<br />\r\n						</p>\r\n						<p>\r\n						<img src="images/stories/tecidos.jpg" alt="tecidos.jpg" title="tecidos.jpg" style="margin: 5px; float: left; width: 417px; height: 170px" width="417" height="170" />&nbsp;&nbsp;						\r\n						</p>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', 1, 0, 0, 0, '2008-10-13 21:02:31', 62, '', '2008-10-21 11:01:04', 62, 0, '0000-00-00 00:00:00', '2008-10-13 21:02:21', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=', 1, 0, 0, '', '', 0, 13),
(7, 'Diverse', 'Diverse', '<table style="width: 100%" width="100%" border="0" cellpadding="5" cellspacing="5">\r\n	<tbody>\r\n		<tr>\r\n			<td valign="top">\r\n			<table style="width: 208px" border="0" cellpadding="3" cellspacing="0">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28">\r\n						<img src="images/stories/foto_diverse.jpg" alt="foto_diverse.jpg" title="foto_diverse.jpg" style="margin: 5px; float: left; width: 204px; height: 267px" width="204" height="267" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: medium none ; height: 5px; font-size: 5px">&nbsp;\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px" valign="middle" align="center">CONHE&Ccedil;A OUTRAS LINHAS\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">&nbsp;</td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/fitness.png" style="width: 136px; height: 45px" alt="fitness.png" title="fitness.png" width="136" height="45" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; padding: 5px; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="middle" align="center">\r\n						<img src="images/stories/shoes.png" alt="shoes.png" title="shoes.png" /></td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n			<td valign="top">\r\n			<table style="border: 1px solid #2d2a28" width="420">\r\n				<tbody>\r\n					<tr>\r\n						<td style="border: 1px solid #2d2a28; background-color: #171411; background-image: url(''http://localhost/NovoMobtex/templates/mobtex/images/fundobolinha.gif'')" valign="top" height="100">\r\n						<hr size="1" width="100%" color="#ffbc2d" />\r\n						<img src="images/stories/diverse.png" style="margin: 5px 20px; width: 152px; height: 50px" alt="diverse.png" title="diverse.png" width="152" height="50" /><img src="images/stories/bandeira_roxa.png" alt="bandeira_roxa.png" title="bandeira_roxa.png" style="margin: 5px; float: right; width: 91px; height: 38px" width="91" height="38" />\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td valign="top">\r\n						<p>\r\n						<br />\r\n						<br />\r\n						Tecnologia e conforto, a Linha de Tecidos Fitness da Mobtex alia tend&ecirc;ncias da moda &agrave; tecnologia. Voce encontrat&aacute; tecidos para toda as modalidades esportivas que necessitam resist&ecirc;ncia, qualidade e flexibilidade. Nossa inten&ccedil;&atilde;o &eacute; aumentar ainda mais as possibilidades para cria&ccedil;&atilde;o.<br />\r\n						<br />\r\n						</p>\r\n						<p>\r\n						<img src="images/stories/tecidos.jpg" alt="tecidos.jpg" title="tecidos.jpg" style="margin: 5px; float: left; width: 417px; height: 170px" width="417" height="170" />&nbsp;&nbsp;						\r\n						</p>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', 1, 0, 0, 0, '2008-10-13 21:02:49', 62, '', '2008-10-21 11:00:56', 62, 0, '0000-00-00 00:00:00', '2008-10-13 21:02:33', '0000-00-00 00:00:00', '', '', 'menu_image=-1\nitem_title=0\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=', 1, 0, 0, '', '', 0, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_content_frontpage`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `aro_id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`aro_id`),
  UNIQUE KEY `jos_gacl_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`aro_id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  PRIMARY KEY  (`group_id`),
  KEY `parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`group_id`, `parent_id`, `name`, `lft`, `rgt`) VALUES
(17, 0, 'ROOT', 1, 22),
(28, 17, 'USERS', 2, 21),
(29, 28, 'Public Frontend', 3, 12),
(18, 29, 'Registered', 4, 11),
(19, 18, 'Author', 5, 10),
(20, 19, 'Editor', 6, 9),
(21, 20, 'Publisher', 7, 8),
(30, 28, 'Public Backend', 13, 20),
(23, 30, 'Manager', 14, 19),
(24, 23, 'Administrator', 15, 18),
(25, 24, 'Super Administrator', 16, 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `section_id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`section_id`),
  UNIQUE KEY `value_aro_sections` (`value`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `hidden_aro_sections` (`hidden`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`section_id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Público'),
(1, 'Registrado'),
(2, 'Especial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_jce_langs`
--

CREATE TABLE IF NOT EXISTS `jos_jce_langs` (
  `id` int(11) NOT NULL auto_increment,
  `Name` varchar(100) NOT NULL default '',
  `lang` varchar(100) NOT NULL default '',
  `published` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `jos_jce_langs`
--

INSERT INTO `jos_jce_langs` (`id`, `Name`, `lang`, `published`) VALUES
(1, 'English', 'en', 0),
(3, 'Brazilian Portuguese', 'pt_br', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_jce_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_jce_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `plugin` varchar(100) NOT NULL default '',
  `type` varchar(100) NOT NULL default 'plugin',
  `icon` varchar(255) NOT NULL default '',
  `layout_icon` varchar(255) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '18',
  `row` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `editable` tinyint(3) NOT NULL default '0',
  `elements` varchar(255) NOT NULL default '',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `plugin` (`plugin`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Extraindo dados da tabela `jos_jce_plugins`
--

INSERT INTO `jos_jce_plugins` (`id`, `name`, `plugin`, `type`, `icon`, `layout_icon`, `access`, `row`, `ordering`, `published`, `editable`, `elements`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Context Menu', 'contextmenu', 'plugin', '', '', 18, 0, 0, 0, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Directionality', 'directionality', 'plugin', 'ltr,rtl', 'directionality', 18, 3, 8, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(3, 'Emotions', 'emotions', 'plugin', 'emotions', 'emotions', 18, 4, 12, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Fullscreen', 'fullscreen', 'plugin', 'fullscreen', 'fullscreen', 18, 4, 6, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'Paste', 'paste', 'plugin', 'pasteword,pastetext', 'paste', 18, 1, 16, 1, 1, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(6, 'Preview', 'preview', 'plugin', 'preview', 'preview', 18, 4, 1, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(7, 'Tables', 'table', 'plugin', 'tablecontrols', 'buttons', 18, 2, 8, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(8, 'Print', 'print', 'plugin', 'print', 'print', 18, 4, 3, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(9, 'Search Replace', 'searchreplace', 'plugin', 'search,replace', 'searchreplace', 18, 1, 17, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(10, 'Styles', 'style', 'plugin', 'styleprops', 'styleprops', 18, 4, 7, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(11, 'Non-Breaking', 'nonbreaking', 'plugin', 'nonbreaking', 'nonbreaking', 18, 4, 8, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(12, 'Visual Characters', 'visualchars', 'plugin', 'visualchars', 'visualchars', 18, 4, 9, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(13, 'XHTML Xtras', 'xhtmlxtras', 'plugin', 'cite,abbr,acronym,del,ins,attribs', 'xhtmlxtras', 18, 4, 10, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Image Manager', 'imgmanager', 'plugin', '', 'imgmanager', 18, 4, 13, 1, 1, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(15, 'Advanced Link', 'advlink', 'plugin', '', 'advlink', 18, 4, 14, 1, 1, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Spell Checker', 'spellchecker', 'plugin', 'spellchecker', 'spellchecker', 18, 4, 15, 1, 1, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(17, 'Layers', 'layer', 'plugin', 'insertlayer,moveforward,movebackward,absolute', 'layer', 18, 4, 11, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(18, 'Font ForeColour', 'forecolor', 'command', 'forecolor', 'forecolor', 18, 3, 4, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Bold', 'bold', 'command', 'bold', 'bold', 18, 1, 5, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(20, 'Italic', 'italic', 'command', 'italic', 'italic', 18, 1, 6, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Underline', 'underline', 'command', 'underline', 'underline', 18, 1, 7, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Font BackColour', 'backcolor', 'command', 'backcolor', 'backcolor', 18, 3, 5, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Unlink', 'unlink', 'command', 'unlink', 'unlink', 18, 2, 11, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'Font Select', 'fontselect', 'command', 'fontselect', 'fontselect', 18, 3, 2, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'Font Size Select', 'fontsizeselect', 'command', 'fontsizeselect', 'fontsizeselect', 18, 3, 3, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(26, 'Style Select', 'styleselect', 'command', 'styleselect', 'styleselect', 18, 3, 1, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(27, 'New Document', 'newdocument', 'command', 'newdocument', 'newdocument', 18, 1, 4, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'Help', 'help', 'command', 'help', 'help', 18, 1, 3, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(29, 'StrikeThrough', 'strikethrough', 'command', 'strikethrough', 'strikethrough', 18, 1, 12, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(30, 'Indent', 'indent', 'command', 'indent', 'indent', 18, 1, 11, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(31, 'Outdent', 'outdent', 'command', 'outdent', 'outdent', 18, 1, 10, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'Undo', 'undo', 'command', 'undo', 'undo', 18, 1, 1, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'Redo', 'redo', 'command', 'redo', 'redo', 18, 1, 2, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'Horizontal Rule', 'hr', 'command', 'hr', 'hr', 18, 2, 1, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'HTML', 'html', 'command', 'code', 'code', 18, 1, 13, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(36, 'Numbered List', 'numlist', 'command', 'numlist', 'numlist', 18, 1, 9, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(37, 'Bullet List', 'bullist', 'command', 'bullist', 'bullist', 18, 1, 8, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(38, 'Clipboard Actions', 'clipboard', 'command', 'cut,copy,paste', 'clipboard', 18, 1, 16, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(39, 'Subscript', 'sub', 'command', 'sub', 'sub', 18, 2, 2, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(40, 'Superscript', 'sup', 'command', 'sup', 'sup', 18, 2, 3, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(41, 'Visual Aid', 'visualaid', 'command', 'visualaid', 'visualaid', 18, 3, 7, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(42, 'Character Map', 'charmap', 'command', 'charmap', 'charmap', 18, 3, 6, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(43, 'Justify Full', 'full', 'command', 'justifyfull', 'justifyfull', 18, 2, 7, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(44, 'Justify Center', 'center', 'command', 'justifycenter', 'justifycenter', 18, 2, 5, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(45, 'Justify Left', 'left', 'command', 'justifyleft', 'justifyleft', 18, 2, 6, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(46, 'Justify Right', 'right', 'command', 'justifyright', 'justifyright', 18, 2, 4, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(47, 'Remove Format', 'removeformat', 'command', 'removeformat', 'removeformat', 18, 1, 15, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(48, 'Anchor', 'anchor', 'command', 'anchor', 'anchor', 18, 2, 9, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(49, 'Format Select', 'formatselect', 'command', 'formatselect', 'formatselect', 18, 3, 9, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(50, 'Image', 'image', 'command', 'image', 'image', 18, 4, 1, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', ''),
(51, 'Link', 'link', 'command', 'link', 'link', 18, 4, 1, 1, 0, '', 1, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_mambots`
--

CREATE TABLE IF NOT EXISTS `jos_mambots` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Extraindo dados da tabela `jos_mambots`
--

INSERT INTO `jos_mambots` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'MOS: Imagem', 'mosimage', 'content', 0, -10000, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'MOS: Paginação', 'mospaging', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(3, 'Inclusão de Plugins Antigos', 'legacybots', 'content', 0, 1, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'SEF em Artigos', 'mossef', 'content', 0, 3, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'MOS: Votação', 'mosvote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(6, 'Procurar Conteúdo', 'content.searchbot', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(7, 'Procurar Weblinks', 'weblinks.searchbot', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(8, 'Suporte de Código', 'moscode', 'content', 0, 2, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(9, 'Editor não WYSIWYG', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(10, 'Editor WYSIWYG TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'theme=advanced'),
(11, 'MOS: Botão de Imagem', 'mosimage.btn', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(12, 'MOS: Botão de Quebra de Página', 'mospage.btn', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(13, 'Procurar Contatos', 'contacts.searchbot', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Procurar Categorias', 'categories.searchbot', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(15, 'Procurar Seções', 'sections.searchbot', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Proteção de Email', 'mosemailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(17, 'GeSHi', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(18, 'Procurar Notícias Externas', 'newsfeeds.searchbot', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Posicionador de Módulos', 'mosloadposition', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'JCE Editor Mambot', 'jce', 'editors', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(25) default NULL,
  `name` varchar(100) default NULL,
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`) VALUES
(1, 'mainmenu', 'HOME', 'index.php?option=com_frontpage', 'components', 0, 0, 10, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=flecha.png\npageclass_sfx=\nheader=Welcome to the Frontpage\npage_title=0\nback_button=0\nleading=1\nintro=2\ncolumns=2\nlink=1\norderby_pri=\norderby_sec=front\npagination=2\npagination_results=1\nimage=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nitem_title=1\nlink_titles=\nreadmore=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=0\nprint=0\nemail=0\nunpublished=0'),
(2, 'mainmenu', 'Empresa', 'http://www.google.com.br', 'url', -2, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1'),
(3, 'mainmenu', 'Nossa Marca', 'http://www.google.com.br', 'url', -2, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1'),
(4, 'mainmenu', 'Tecidos', 'http://www.google.com.br', 'url', -2, 0, 0, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1'),
(5, 'mainmenu', 'Fitness', 'http://www.google.com.br', 'url', -2, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1'),
(6, 'mainmenu', 'Shoes', 'http://www.google.com.br', 'url', -2, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1'),
(7, 'mainmenu', 'Diverse', 'http://www.google.com.br', 'url', -2, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1'),
(8, 'mainmenu', 'EMPRESA', 'index.php?option=com_content&task=view&id=2', 'content_typed', 1, 0, 2, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(9, 'mainmenu', 'NOSSA MARCA', 'index.php?option=com_content&task=view&id=3', 'content_typed', 1, 8, 3, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(10, 'mainmenu', 'TECIDOS', 'index.php?option=com_content&task=view&id=4', 'content_typed', 1, 0, 4, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(11, 'mainmenu', 'FITNESS', 'index.php?option=com_content&task=view&id=5', 'content_typed', 1, 10, 5, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(12, 'mainmenu', 'SHOES', 'index.php?option=com_content&task=view&id=6', 'content_typed', 1, 10, 6, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(13, 'mainmenu', 'DIVERSE', 'index.php?option=com_content&task=view&id=7', 'content_typed', 1, 10, 7, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(14, 'mainmenu', 'CONTATO', 'index.php?option=com_content&task=view&id=8', 'content_typed', -2, 0, 8, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(15, 'mainmenu', 'HOME', 'index.php?option=com_content&task=view&id=1', 'content_typed', 1, 0, 1, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\nunique_itemid=0'),
(16, 'mainmenu', 'CONTATO', 'index.php?option=com_contact', 'components', 1, 0, 7, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npageclass_sfx=\nback_button=\npage_title=0\nheader=\ncatid=1\nother_cat_section=1\nother_cat=1\ncat_description=1\ncat_items=1\ndescription=0\ndescription_text=\nimage=-1\nimage_align=right\nheadings=1\nposition=1\nemail=0\ntelephone=0\nfax=0\nbannedEmail=\nbannedSubject=\nbannedText=\nsessionCheck=1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` varchar(230) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_messages`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(10) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Extraindo dados da tabela `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`) VALUES
(1, 'Enquete', '', 1, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_poll', 0, 0, 1, '', 0, 0),
(2, 'Menu Usuários', '', 5, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 1, 1, 'menutype=usermenu', 1, 0),
(3, 'Menu Principal', '', 4, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'class_sfx=\nmoduleclass_sfx=\nmenutype=mainmenu\nmenu_style=vert_indent\nfull_active_id=0\ncache=0\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nactivate_parent=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=', 1, 0),
(4, 'Login', '', 7, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_login', 0, 0, 1, '', 1, 0),
(5, 'Difusão de Notícias', '', 8, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_rssfeed', 0, 0, 1, '', 1, 0),
(6, 'Últimas Notícias', '', 4, 'user1', 0, '0000-00-00 00:00:00', 0, 'mod_latestnews', 0, 0, 1, '', 1, 0),
(7, 'Estatísticas', '', 9, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_stats', 0, 0, 1, 'serverinfo=1\nsiteinfo=1\ncounter=1\nincrease=0\nmoduleclass_sfx=', 0, 0),
(8, 'Usuários On-line', '', 1, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_whosonline', 0, 0, 1, 'online=1\nusers=1\nmoduleclass_sfx=', 0, 0),
(9, 'Popular', '', 6, 'user2', 0, '0000-00-00 00:00:00', 0, 'mod_mostread', 0, 0, 1, '', 0, 0),
(10, 'Escolher Tema', '', 10, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_templatechooser', 0, 0, 1, 'show_preview=1', 0, 0),
(11, 'Arquivo', '', 11, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_archive', 0, 0, 1, '', 1, 0),
(12, 'Seções', '', 12, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_sections', 0, 0, 1, '', 1, 0),
(13, 'Flash de Notícias', '', 1, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_newsflash', 0, 0, 1, 'catid=3\r\nstyle=random\r\nitems=\r\nmoduleclass_sfx=', 0, 0),
(14, 'Itens Relacionados', '', 13, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_related_items', 0, 0, 1, '', 0, 0),
(15, 'Procurar', '', 1, 'user4', 0, '0000-00-00 00:00:00', 0, 'mod_search', 0, 0, 0, '', 0, 0),
(16, 'Imagens Aleatórias', '', 9, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_random_image', 0, 0, 1, '', 0, 0),
(17, 'Top Menu', '', 1, 'user3', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=topmenu\nmenu_style=list_flat\nmenu_images=n\nmenu_images_align=left\nexpand_menu=n\nclass_sfx=-nav\nmoduleclass_sfx=\nindent_image1=0\nindent_image2=0\nindent_image3=0\nindent_image4=0\nindent_image5=0\nindent_image6=0', 1, 0),
(18, 'Banners', '', 1, 'banner', 0, '0000-00-00 00:00:00', 0, 'mod_banners', 0, 0, 0, 'banner_cids=\nmoduleclass_sfx=\n', 1, 0),
(19, 'Componente', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_components', 0, 99, 1, '', 1, 1),
(20, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 99, 1, '', 0, 1),
(21, 'Últimos', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 99, 1, '', 0, 1),
(22, 'Menus', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 99, 1, '', 0, 1),
(23, 'Mensagens Não Lidas', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 99, 1, '', 1, 1),
(24, 'Usuários Online', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 99, 1, '', 1, 1),
(25, 'Menu Completo', '', 1, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_fullmenu', 0, 99, 1, '', 1, 1),
(26, 'Caminho de Navegação', '', 1, 'pathway', 0, '0000-00-00 00:00:00', 1, 'mod_pathway', 0, 99, 1, '', 1, 1),
(27, 'Barra', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 99, 1, '', 1, 1),
(28, 'Mensagem de Sistema', '', 1, 'inset', 0, '0000-00-00 00:00:00', 1, 'mod_mosmsg', 0, 99, 1, '', 1, 1),
(29, 'Ícones Rápidos', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 99, 1, '', 1, 1),
(30, 'Outro Menu', '', 6, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=othermenu\nmenu_style=vert_indent\ncache=0\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nclass_sfx=\nmoduleclass_sfx=\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=', 0, 0),
(31, 'Wrapper', '', 14, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_wrapper', 0, 0, 1, '', 0, 0),
(32, 'Logado', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 99, 1, '', 0, 1),
(33, 'SBD Accordion Menu', '', 3, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_sbd_rollmenu', 0, 0, 0, 'class_sfx=\nmoduleclass_sfx=\nmenulevel_sfx=0\nlevel_sfx=1\nparentlevel=1\nattemptvalidation=0\njoomlaver=1\nhidemenunoscript=0\nnoscriptmsg=Menu Requires Javascript\nmenutype=mainmenu\ncache=0\ntime_delay=1500\nmenu_delay=10\nfull_active_id=0\nuse_mouseover=1\ntop_linkclick=1\nnoextramenu=1\nopenparentmenu=1\nopensinglemenu=1\nusecompressedjs=1', 0, 0),
(36, 'Rodapé', '2008 MOBTEX | Tel. (55) 47 3435-2803 | mobtex@mobtex.com.br | Dona Francisca, 9215, CEP 89239-270 - Joinville - SC - BR\r\n', 1, 'footer', 0, '0000-00-00 00:00:00', 1, '', 0, 0, 0, 'moduleclass_sfx=\ncache=0\nfirebots=1\nrssurl=\nrsstitle=1\nrssdesc=1\nrssimage=1\nrssitems=3\nrssitemdesc=1\nword_count=0\nrsscache=3600', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 1),
(2, 0),
(3, 0),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(6, 4),
(6, 27),
(6, 36),
(8, 1),
(9, 1),
(9, 2),
(9, 4),
(9, 27),
(9, 36),
(10, 1),
(13, 0),
(15, 0),
(17, 0),
(18, 0),
(30, 0),
(33, 0),
(36, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_polls`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(4) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_poll_data`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `image` varchar(100) NOT NULL default '',
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(10) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_sections`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(50) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `whosonline` (`guest`,`usertype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`) VALUES
('', '1473289242', '800f2383b5ed0772205661f44a08ef92', 1, 0, '', 0),
('admin', '1473289217', 'f00f0ba62a04f903afd9c0a25d060037', 1, 62, 'Super Administrator', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(50) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`template`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('mobtex', 0, 0),
('joomla_admin', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_template_positions`
--

CREATE TABLE IF NOT EXISTS `jos_template_positions` (
  `id` int(11) NOT NULL auto_increment,
  `position` varchar(10) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `jos_template_positions`
--

INSERT INTO `jos_template_positions` (`id`, `position`, `description`) VALUES
(1, 'left', ''),
(2, 'right', ''),
(3, 'top', ''),
(4, 'bottom', ''),
(5, 'inset', ''),
(6, 'banner', ''),
(7, 'header', ''),
(8, 'footer', ''),
(9, 'newsflash', ''),
(10, 'legals', ''),
(11, 'pathway', ''),
(12, 'toolbar', ''),
(13, 'cpanel', ''),
(14, 'user1', ''),
(15, 'user2', ''),
(16, 'user3', ''),
(17, 'user4', ''),
(18, 'user5', ''),
(19, 'user6', ''),
(20, 'user7', ''),
(21, 'user8', ''),
(22, 'user9', ''),
(23, 'advert1', ''),
(24, 'advert2', ''),
(25, 'advert3', ''),
(26, 'icon', ''),
(27, 'debug', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `username` varchar(25) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Extraindo dados da tabela `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'contato@mobtex.com.br', '3656e07ec982ad642c6e364e08275ece:28msSBnKPAaccdkG', 'Super Administrator', 0, 1, 25, '2008-10-07 07:43:47', '2008-10-20 18:51:37', '', 'editor=');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_usertypes`
--

CREATE TABLE IF NOT EXISTS `jos_usertypes` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `mask` varchar(11) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `jos_usertypes`
--

INSERT INTO `jos_usertypes` (`id`, `name`, `mask`) VALUES
(0, 'superadministrator', ''),
(1, 'administrator', ''),
(2, 'editor', ''),
(3, 'user', ''),
(4, 'author', ''),
(5, 'publisher', ''),
(6, 'manager', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` varchar(250) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_weblinks`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
