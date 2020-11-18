FROM centos:7.6.1810

RUN yum update -y && yum install unzip gcc perl perl-DBI perl-CPAN tar perl-DBD-Pg postgresql-devel perl-open make glibc -y

RUN curl -L -o /tmp/ora2pg.zip https://github.com/darold/ora2pg/archive/v20.0.zip && (cd /tmp && unzip ora2pg.zip && rm -f ora2pg.zip) && \
 mv /tmp/ora2pg* /tmp/ora2pg && (cd /tmp/ora2pg && perl Makefile.PL && make && make install)

RUN mkdir /usr/lib/oracle/19.5/client64/network/admin -p

RUN curl -o /tmp/oraclient-basic.rpm https://download.oracle.com/otn_software/linux/instantclient/195000/oracle-instantclient19.5-basic-19.5.0.0.0-1.x86_64.rpm && \
    yum install /tmp/oraclient-basic.rpm --nogpgcheck -y && \
    rm -f /tmp/oraclient-basic.rpm && \
    curl -o /tmp/oraclient-devel.rpm https://download.oracle.com/otn_software/linux/instantclient/195000/oracle-instantclient19.5-devel-19.5.0.0.0-1.x86_64.rpm && \
    yum install /tmp/oraclient-devel.rpm --nogpgcheck -y && \
    rm -f /tmp/oraclient-devel.rpm && \
    curl -o /tmp/oraclient-sqlplus.rpm https://download.oracle.com/otn_software/linux/instantclient/195000/oracle-instantclient19.5-sqlplus-19.5.0.0.0-1.x86_64.rpm && \
    yum install /tmp/oraclient-sqlplus.rpm --nogpgcheck -y && \
    rm -f /tmp/oraclient-sqlplus.rpm

ENV ORACLE_HOME=/usr/lib/oracle/19.5/client64
ENV TNS_ADMIN=/usr/lib/oracle/19.5/client64/network/admin
ENV LD_LIBRARY_PATH=/usr/lib/oracle/19.5/client64/lib
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/oracle/19.5/client64/bin

RUN curl -L http://www.perl.org/CPAN/authors/id/P/PY/PYTHIAN/DBD-Oracle-1.74.tar.gz | (cd /tmp && tar -zxvf -) && \
    mv /tmp/DBD-Ora* /tmp/DBD-Oracle

RUN cd /tmp/DBD-Oracle && perl Makefile.PL -l && make && make install

RUN mkdir /data

RUN ora2pg --project_base /data --init_project ora2pg-example

VOLUME /data
