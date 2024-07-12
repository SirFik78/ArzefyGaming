package Controller;

import Database.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Game;


public class GameDAO {

    public Game getGameById(int gameId) {
        Game game = null;
        try (Connection connection = DBConnection.setConnection()) {
            String query = "SELECT * FROM tbl_game WHERE id_game = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, gameId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        game = new Game();
                        game.setId(resultSet.getInt("id_game"));
                        game.setName(resultSet.getString("nama_game"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return game;
    }
}
