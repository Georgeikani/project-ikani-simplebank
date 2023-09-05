package db

import (
	"context"
	"testing"

	"github.com/Georgeikani/project-ikani-simplebank/util"
	"github.com/stretchr/testify/require"
)



func createRandomEntry(t  *testing.T, account Account) Entry {
	arg := CreateEntryParams{
		AccountID: 	 account.ID, 
		Amount: 	 util.RandomMoney(),
		
	}

	entry, err := testStore.CreateEntry(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, entry)


	require.Equal(t, arg.AccountID, entry.AccountID)
	require.Equal(t, arg.Amount, entry.Amount)
	
	require.NotZero(t, entry.ID)
	require.NotZero(t, entry.CreatedAt)

	return entry
}