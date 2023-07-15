CREATE TABLE [dbo].[Address] (
    [Id]           INT          NOT NULL,
    [address_id]   INT          NOT NULL,
    [city]       VARCHAR(50) NULL,
    [state] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

