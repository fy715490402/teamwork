create table forum_attachment (
       id varchar(255) not null,
        createTime datetime,
        filePath varchar(255),
        name varchar(255),
        post_id varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table forum_board (
       id varchar(255) not null,
        createTime datetime,
        description varchar(255),
        imageUrl varchar(255),
        title varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table forum_post (
       type varchar(31) not null,
        id varchar(255) not null,
        content varchar(255),
        createTime datetime,
        topic_id varchar(255),
        user_id varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table forum_topic (
       id varchar(255) not null,
        createTime datetime,
        replys bigint,
        title varchar(255),
        views bigint,
        board_id varchar(255),
        user_id varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table team_department (
       id varchar(255) not null,
        name varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table team_user (
       id varchar(255) not null,
        createTime datetime,
        email varchar(255),
        enabled tinyint,
        headUrl varchar(255),
        password varchar(255),
        phoneNumber varchar(255),
        realname varchar(255),
        username varchar(255),
        department_id varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user_board (
       board_id varchar(255) not null,
        user_id varchar(255) not null,
        primary key (user_id, board_id)
    ) engine=InnoDB

    create table user_loginlog (
       id varchar(255) not null,
        ip varchar(15),
        loginTime datetime,
        user_id varchar(255),
        primary key (id)
    ) engine=InnoDB

    alter table forum_attachment
       add constraint FKf5t1ocbfxq65sqapo4j92b1li
       foreign key (post_id)
       references forum_post (id)

    alter table forum_post
       add constraint FK1348l2a2ollyahm5vnv5vcye3
       foreign key (topic_id)
       references forum_topic (id)

    alter table forum_post
       add constraint FKeclo6l4owxh4ct251olgtdd2w
       foreign key (user_id)
       references team_user (id)

    alter table forum_topic
       add constraint FK7yc90rx0scwi8mpmujy41b933
       foreign key (board_id)
       references forum_board (id)

    alter table forum_topic
       add constraint FKmwj52fqbehha6gqcy13t636ql
       foreign key (user_id)
       references team_user (id)

    alter table team_user
       add constraint FK3urg94yyabdtg9aomex5odx63
       foreign key (department_id)
       references team_department (id)

    alter table user_board
       add constraint FK5h6ocqciwimk4a1idavs4t18b
       foreign key (user_id)
       references team_user (id)

    alter table user_board
       add constraint FKgbsrsrurmwxru6d6wrtdlc5b9
       foreign key (board_id)
       references forum_board (id)

    alter table user_loginlog
       add constraint FKd4ctb0eki54ofosr4d74ouow0
       foreign key (user_id)
       references team_user (id)