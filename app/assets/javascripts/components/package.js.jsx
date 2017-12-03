var Package = createReactClass({

  render: function() {
    return(
      <div className="panel panel-info">
        <div className="panel-heading"><h3>{ this.props.package.name } ({ this.props.package.latest_version })</h3></div>
        <div className="panel-body">
          { this.props.package.description }
          <br />
          <br />
          <small>Authors: { this.props.package.authors }</small>
          <br />
          <small>Maintainers: { this.props.package.maintainers }</small>
        </div>
        <div className="panel-footer">
          Click <a href={this.props.package.link}>here</a> to download
        </div>
      </div>
    );
  }
});
