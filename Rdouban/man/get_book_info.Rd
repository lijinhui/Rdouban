\encoding{UTF-8}
\name{get_book_info}
\alias{get_book_info}
\title{��ȡ����ͼ�������Ϣ}
\description{ ��ȡ����ͼ�������Ϣ,�������ߡ���顢�������ֵ�.}

\usage{get_book_info(bookid,...)
}
\arguments{
  \item{bookid}{�����鼮��id��,һ������,��20326626,��ͨ��ͼ��Ķ�����ҳ��ѯ}}

\value{һ���б�list,����:
  \item{book_base_info}{�鼮�Ļ�����Ϣ,�����ߡ��������} 
  \item{rating}{����Ϊ7������,�û�������Ϣ,\code{score}Ϊ�ܷ�,\code{votes}ָ�������������,\code{starsx}ָ��Ӧ�����û�����ռ�ı���}
 \item{content_intro}{�鼮���ݼ��}
 \item{author_intro}{���߼��}
\item{label_amount}{�û����ñ�ǩ����}
\item{labels}{һ������data.frame,\code{label_name}��ǩ���Ƽ���Ӧ��ʹ��Ƶ��\code{label_freq}}
\item{comments_notes_amount}{����Ϊ2������,����\code{comments_amount}��������,\code{notes_amount}Ϊ�ʼ�����}\item{reader_info}{����Ϊ3������,\code{doings}ָ�����Ķ����û�����,\code{collections}ָ�Ѷ����û�����,\code{wishes}ָ������û�����}}


\note{\code{bookid}�����Ƕ���ͼ����Ч��id.}

\author{
   <\email{qxde01@@gmail.com}>
}
\examples{
## http://book.douban.com/subject/1291204/
\dontrun{get_book_info(bookid='1291204')}
}
\keyword{book}
\keyword{douban}