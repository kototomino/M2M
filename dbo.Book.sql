CREATE TABLE [dbo].[Book] (
    [Id]         INT          NOT NULL,
    [bookName]   VARCHAR (50) NOT NULL,
    [autorName]  VARCHAR (50) NOT NULL,
    [quantity]   INT          NOT NULL,
    [subscriber] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

